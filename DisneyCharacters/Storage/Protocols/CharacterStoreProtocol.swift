////
//  CharacterStoreProtocol.swift
//  DisneyCharacters
//
//  Created by Tu Adrian Azpi el 13/06/26.
//  
//

import Foundation

protocol CharacterStoreProtocol {
    func save(_ characters: [DisneyCharacter], page: Int) throws
    func load(page: Int) -> [DisneyCharacter]
    func loadAll() -> [DisneyCharacter]
}
