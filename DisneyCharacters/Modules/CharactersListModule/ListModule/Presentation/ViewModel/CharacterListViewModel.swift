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
    @Published var isLoadingMoreCharacters: Bool = false
    
    private let getCachedCharactersUseCase: GetCachedCharactersUseCaseProtocol
    private let getCharactersUseCase: FetchCharactersUseCaseProtocol
    
    init(getCachedCharactersUseCase: GetCachedCharactersUseCaseProtocol = GetCachedCharactersUseCase(),
         getCharactersUseCase: FetchCharactersUseCaseProtocol = FetchCharactersUseCase()) {
        self.getCachedCharactersUseCase = getCachedCharactersUseCase
        self.getCharactersUseCase = getCharactersUseCase
    }
    
    func loadInitialData() async {
        guard characters.isEmpty else {
            return
        }
        let local = getCachedCharactersUseCase.execute()
        if !local.isEmpty {
            await MainActor.run {
                characters = local
                isLoading = false
            }
        } else {
            await MainActor.run { isLoading = true }
        }
        await rerfeshLocal()
        await MainActor.run { isLoading = false }
    }
    
    private func rerfeshLocal() async {
        await load(page: 1, isRefresh: true)
        await MainActor.run { isLoadingMoreCharacters = false }
    }
    
    func loadMoreCharacters() async {
        guard hasNextPage, !isLoadingMoreCharacters else {
            return
        }
        await MainActor.run { isLoadingMoreCharacters = true }
        await load(page: currentPage + 1, isRefresh: false)
        await MainActor.run { isLoadingMoreCharacters = false }
    }
    
    private func load(page: Int, isRefresh: Bool) async {
        do {
            let result = try await getCharactersUseCase.execute(page: page)
            await MainActor.run {
                if isRefresh {
                    characters = result.characters
                } else {
                    characters += result.characters
                }
                hasNextPage = result.hasNextPage
                currentPage = result.page
                errorString = nil
            }
        } catch {
            await MainActor.run {
                self.errorString = characters.isEmpty ? error.localizedDescription : nil
            }
        }
    }
    
    func pullToRefresh() async {
        await load(page: 1, isRefresh: true)
    }
}
