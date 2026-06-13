////
//  CharacterDetailViewModel.swift
//  DisneyCharacters
//
//  Created by Tu Adrian Azpi el 13/06/26.
//  
//

import Combine

final class CharacterDetailViewModel: ObservableObject {
    @Published var character: DisneyCharacter
    @Published var isFavorite: Bool = false

    init(character: DisneyCharacter) {
        self.character = character
    }

    func toggleFavorite() {
        isFavorite.toggle()
    }
}
