////
//  CheckFavoriteUseCase.swift
//  DisneyCharacters
//
//  Created by Tu Adrian Azpi el 13/06/26.
//  
//

protocol CheckFavoriteUseCaseProtocol {
    func execute(_ character: DisneyCharacter) -> Bool
}

final class CheckFavoriteUseCase: CheckFavoriteUseCaseProtocol {
    private let repository: FavoritesRepositoryProtocol

    init(repository: FavoritesRepositoryProtocol = FavoritesRepository()) {
        self.repository = repository
    }

    func execute(_ character: DisneyCharacter) -> Bool {
        repository.isFavorite(character)
    }
}
