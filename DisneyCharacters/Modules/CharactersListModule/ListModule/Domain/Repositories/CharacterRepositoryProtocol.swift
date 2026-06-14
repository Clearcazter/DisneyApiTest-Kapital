////
//  CharacterRepositoryProtocol.swift
//  DisneyCharacters
//
//  Created by Tu Adrian Azpi el 13/06/26.
//  
//

protocol CharacterRepositoryProtocol {
    func getCachedCharacters() -> [DisneyCharacter]
    func getCharactersBy(page: Int) async throws -> CharactersPage
}
