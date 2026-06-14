////
//  GetFavoritesUseCase.swift
//  DisneyCharacters
//
//  Created by Tu Adrian Azpi el 13/06/26.
//  
//

protocol GetFavoritesUseCaseProtocol {
    func execute() -> [DisneyCharacter]
}

final class GetFavoritesUseCase: GetFavoritesUseCaseProtocol {
    private let repository: FavoritesRepositoryProtocol

    init(repository: FavoritesRepositoryProtocol = FavoritesRepository()) {
        self.repository = repository
    }

    func execute() -> [DisneyCharacter] {
        repository.getAllFavorites()
    }
}
