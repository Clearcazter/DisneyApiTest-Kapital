////
//  CharacterDetailViewModel.swift
//  DisneyCharacters
//
//  Created by Tu Adrian Azpi el 13/06/26.
//
//

import Combine

final class CharacterDetailViewModel: ObservableObject {
    @Published var isFavorite: Bool = false
    
    let character: DisneyCharacter
    private let store: FavoritesStoreProtocol
    
    init(character: DisneyCharacter,
         store: FavoritesStoreProtocol = FavoritesStoreImplementation.shared) {
        self.character = character
        self.store = store
        self.isFavorite = store.isFavorite(character)
    }
    
    func toggleFavorite() {
        do {
            if isFavorite {
                try store.remove(character)
            } else {
                try store.add(character)
            }
            isFavorite.toggle()
        } catch {
            debugPrint("Error al guardar favorito: \(error)")
            // manejo de error en caso de no poder guardar
        }
    }
}
