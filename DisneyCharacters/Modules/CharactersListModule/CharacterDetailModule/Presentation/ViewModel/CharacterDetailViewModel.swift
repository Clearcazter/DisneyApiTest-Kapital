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
    private let checkFavoriteUseCase: CheckFavoriteUseCaseProtocol
    private let toggleFavoriteUseCase: ToggleFavoriteUseCaseProtocol
    
    init(character: DisneyCharacter,
         checkFavoriteUseCase: CheckFavoriteUseCaseProtocol = CheckFavoriteUseCase(),
         toggleFavoriteUseCase: ToggleFavoriteUseCaseProtocol = ToggleFavoriteUseCase()) {
        self.character = character
        self.checkFavoriteUseCase = checkFavoriteUseCase
        self.toggleFavoriteUseCase = toggleFavoriteUseCase
        self.isFavorite = checkFavoriteUseCase.execute(character)
    }
    
    func toggleFavorite() {
        do {
            isFavorite = try toggleFavoriteUseCase.execute(character)
        } catch {
            debugPrint("Error al guardar favorito: \(error)")
        }
    }
}
