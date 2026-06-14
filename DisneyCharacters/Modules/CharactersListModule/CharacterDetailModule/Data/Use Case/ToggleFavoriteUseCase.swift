////
//  ToggleFavoriteUseCase.swift
//  DisneyCharacters
//
//  Created by Tu Adrian Azpi el 13/06/26.
//  
//

protocol ToggleFavoriteUseCaseProtocol {
    func execute(_ character: DisneyCharacter) throws -> Bool
}

final class ToggleFavoriteUseCase: ToggleFavoriteUseCaseProtocol {
    private let repository: FavoritesRepositoryProtocol

    init(repository: FavoritesRepositoryProtocol = FavoritesRepository()) {
        self.repository = repository
    }

    func execute(_ character: DisneyCharacter) throws -> Bool {
        try repository.toggleFavorite(character)
    }
}
