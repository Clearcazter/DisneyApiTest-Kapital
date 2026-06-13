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

    private let store: FavoritesStoreProtocol

    init(store: FavoritesStoreProtocol = FavoritesStoreImplementation.shared) {
        self.store = store
    }

    func loadFavorites() {
        favorites = store.all()
    }

    func remove(_ character: DisneyCharacter) {
        try? store.remove(character)
        favorites.removeAll { $0.id == character.id }
    }
}
