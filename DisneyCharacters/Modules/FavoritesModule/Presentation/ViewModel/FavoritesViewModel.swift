////
//  FavoritesViewModel.swift
//  DisneyCharacters
//
//  Created by Tu Adrian Azpi el 13/06/26.
//
//

import Combine

final class FavoritesViewModel: ObservableObject {
    @Published var favorites: [DisneyCharacter] = []
    
    private let getFavoritesUseCase: GetFavoritesUseCaseProtocol
    private let removeFavoriteUseCase: RemoveFavoriteUseCaseProtocol
    
    init(getFavoritesUseCase: GetFavoritesUseCaseProtocol = GetFavoritesUseCase(),
         removeFavoriteUseCase: RemoveFavoriteUseCaseProtocol = RemoveFavoriteUseCase()) {
        self.getFavoritesUseCase = getFavoritesUseCase
        self.removeFavoriteUseCase = removeFavoriteUseCase
    }
    
    func loadFavorites() {
        favorites = getFavoritesUseCase.execute()
    }
    
    func remove(_ character: DisneyCharacter) {
        do {
            try removeFavoriteUseCase.execute(character)
            favorites.removeAll { $0.id == character.id }
        } catch {
            debugPrint("Error al eliminar favorito: \(error)")
        }
    }
}
