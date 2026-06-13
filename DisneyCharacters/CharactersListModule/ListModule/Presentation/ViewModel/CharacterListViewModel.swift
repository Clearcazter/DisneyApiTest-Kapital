////
//  CharacterListViewModel.swift
//  DisneyCharacters
//
//  Created by Tu Adrian Azpi el 13/06/26.
//  
//

import Foundation
import Combine

final class CharacterListViewModel: ObservableObject {
    @Published var characters: [DisneyCharacter] = []
    @Published var isLoading: Bool = false
    @Published var errorString: String?
    @Published var currentPage: Int = 1
    @Published var hasNextPage: Bool = true
    @Published var isLoadingMoreCharacters: Bool = true
    
    private let disneyService: DisneyServiceProtocol
    
    init(disneyService: DisneyServiceProtocol = DisneyService.shared) {
        self.disneyService = disneyService
    }
    
    func loadInitialData() async {
        guard characters.isEmpty else {
            return
        }
        await MainActor.run { isLoadingMoreCharacters = true }
        await load(page: currentPage + 1)
        await MainActor.run { isLoadingMoreCharacters = false }
    }
    
    func loadMoreCharacters() async {
        guard hasNextPage, !isLoadingMoreCharacters else {
            return
        }
        await MainActor.run { isLoadingMoreCharacters = true }
                await load(page: currentPage + 1)
                await MainActor.run { isLoadingMoreCharacters = false }
    }
    
    private func load(page: Int) async {
        do {
            let response = try await disneyService.getCharactersBy(page: page)
            await MainActor.run {
                if page == 1 {
                    characters = response.data
                } else {
                    characters += response.data
                }
                hasNextPage = response.info.nextPage != nil
                currentPage = page
            }
        } catch {
            await MainActor.run {
                self.errorString = error.localizedDescription
            }
        }
    }
}
