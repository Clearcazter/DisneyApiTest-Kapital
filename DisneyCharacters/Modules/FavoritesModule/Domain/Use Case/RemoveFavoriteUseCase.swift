////
//  RemoveFavoriteUseCase.swift
//  DisneyCharacters
//
//  Created by Tu Adrian Azpi el 13/06/26.
//  
//

protocol RemoveFavoriteUseCaseProtocol {
    func execute(_ character: DisneyCharacter) throws
}

final class RemoveFavoriteUseCase: RemoveFavoriteUseCaseProtocol {
    private let repository: FavoritesRepositoryProtocol

    init(repository: FavoritesRepositoryProtocol = FavoritesRepository()) {
        self.repository = repository
    }

    func execute(_ character: DisneyCharacter) throws {
        try repository.removeFavorite(character)
    }
}
