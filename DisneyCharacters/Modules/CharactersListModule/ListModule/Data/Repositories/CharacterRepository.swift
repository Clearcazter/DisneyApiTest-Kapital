////
//  CharacterRepository.swift
//  DisneyCharacters
//
//  Created by Tu Adrian Azpi el 13/06/26.
//  
//

import Foundation

final class CharacterRepository: CharacterRepositoryProtocol {
    private let remote: DisneyServiceProtocol
    private let local: CharacterStoreProtocol

    init(remote: DisneyServiceProtocol = DisneyService.shared,
         local: CharacterStoreProtocol = CharacterStoreImplementation.shared) {
        self.remote = remote
        self.local = local
    }

    func getCachedCharacters() -> [DisneyCharacter] {
        local.loadAll()
    }

    func getCharactersBy(page: Int) async throws -> CharactersPage {
        let response = try await remote.getCharactersBy(page: page)
        try? local.save(response.data, page: page)
        return CharactersPage(characters: response.data,
                              hasNextPage: response.info.nextPage != nil,
                              page: page)
    }
}
