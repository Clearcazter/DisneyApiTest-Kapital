////
//  NecessaryMocks.swift
//  DisneyCharacters
//
//  Created by Tu Adrian Azpi el 13/06/26.
//  
//

import Foundation

@testable import DisneyCharacters

extension DisneyCharacter {
    static func mock(id: Int = 1, name: String = "Remy Ratatoille") -> DisneyCharacter {
        DisneyCharacter(
            id: id,
            name: name,
            imageUrl: "https://static.wikia.nocookie.net/disney/images/d/dd/X240-pex.jpg",
            films: ["Film \(id)"],
            tvShows: [],
            videoGames: [],
            parkAttractions: [],
            allies: [],
            enemies: [],
            sourceUrl: nil
        )
    }
}

final class MockGetCachedCharactersUseCase: GetCachedCharactersUseCaseProtocol {
    var result: [DisneyCharacter] = []
    func execute() -> [DisneyCharacter] { result }
}

//View Model
final class MockFetchCharactersUseCase: FetchCharactersUseCaseProtocol {
    var error: Error?
    var result: CharactersPage?

    func execute(page: Int) async throws -> CharactersPage {
        if let error { throw error }
        return result ?? CharactersPage(characters: [], hasNextPage: false, page: page)
    }
}

//Repository
final class MockDisneyService: DisneyServiceProtocol {
    var response: DisneyApiResponse?
    var error: Error?

    func getCharactersBy(page: Int) async throws -> DisneyApiResponse {
        if let error { throw error }
        return response!
    }

    func getCharacter(id: Int) async throws -> DisneyCharacter {
        throw URLError(.unsupportedURL)
    }
}

final class MockCharacterStore: CharacterStoreProtocol {
    private(set) var savedCharacters: [DisneyCharacter] = []
    private(set) var savedPage: Int?

    func save(_ characters: [DisneyCharacter], page: Int) throws {
        savedCharacters = characters
        savedPage = page
    }

    func load(page: Int) -> [DisneyCharacter] { [] }
    func loadAll() -> [DisneyCharacter] { [] }
}
