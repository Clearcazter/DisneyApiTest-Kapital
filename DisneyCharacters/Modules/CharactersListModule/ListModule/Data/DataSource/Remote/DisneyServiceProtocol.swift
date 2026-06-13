////
//  DisneyRequestProtocol.swift
//  DisneyCharacters
//
//  Created by Tu Adrian Azpi el 13/06/26.
//  
//

import Foundation

protocol DisneyServiceProtocol {
    func getCharactersBy(page: Int) async throws -> DisneyApiResponse
    func getCharacter(id: Int) async throws -> DisneyCharacter
}
