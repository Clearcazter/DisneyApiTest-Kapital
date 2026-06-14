////
//  GetCachedCharactersUseCase.swift
//  DisneyCharacters
//
//  Created by Tu Adrian Azpi el 13/06/26.
//  
//

protocol GetCachedCharactersUseCaseProtocol {
    func execute() -> [DisneyCharacter]
}

final class GetCachedCharactersUseCase: GetCachedCharactersUseCaseProtocol {
    private let repository: CharacterRepositoryProtocol

    init(repository: CharacterRepositoryProtocol = CharacterRepository()) {
        self.repository = repository
    }

    func execute() -> [DisneyCharacter] {
        repository.getCachedCharacters()
    }
}
