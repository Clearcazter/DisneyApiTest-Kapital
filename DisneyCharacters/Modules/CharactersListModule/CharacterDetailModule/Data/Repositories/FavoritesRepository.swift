////
//  FavoritesRepository.swift
//  DisneyCharacters
//
//  Created by Tu Adrian Azpi el 13/06/26.
//  
//

final class FavoritesRepository: FavoritesRepositoryProtocol {
    private let local: FavoritesStoreProtocol

    init(local: FavoritesStoreProtocol = FavoritesStoreImplementation.shared) {
        self.local = local
    }

    func isFavorite(_ character: DisneyCharacter) -> Bool {
        local.isFavorite(character)
    }

    func toggleFavorite(_ character: DisneyCharacter) throws -> Bool {
        if local.isFavorite(character) {
            try local.remove(character)
            return false
        } else {
            try local.add(character)
            return true
        }
    }
    
    func getAllFavorites() -> [DisneyCharacter] {
        local.all()
    }

    func removeFavorite(_ character: DisneyCharacter) throws {
        try local.remove(character)
    }
}
