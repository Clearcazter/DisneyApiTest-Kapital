////
//  FavoritesStoreProtocol.swift
//  DisneyCharacters
//
//  Created by Tu Adrian Azpi el 13/06/26.
//  
//

import Foundation

protocol FavoritesStoreProtocol {
    func add(_ character: DisneyCharacter) throws
    func remove(_ character: DisneyCharacter) throws
    func isFavorite(_ character: DisneyCharacter) -> Bool
    func all() -> [DisneyCharacter]
}
