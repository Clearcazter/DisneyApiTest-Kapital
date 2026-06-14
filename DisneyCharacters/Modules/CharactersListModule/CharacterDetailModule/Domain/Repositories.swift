////
//  Repositories.swift
//  DisneyCharacters
//
//  Created by Tu Adrian Azpi el 13/06/26.
//  
//

protocol FavoritesRepositoryProtocol {
    func isFavorite(_ character: DisneyCharacter) -> Bool
    func toggleFavorite(_ character: DisneyCharacter) throws -> Bool
    func getAllFavorites() -> [DisneyCharacter]
    func removeFavorite(_ character: DisneyCharacter) throws
}
