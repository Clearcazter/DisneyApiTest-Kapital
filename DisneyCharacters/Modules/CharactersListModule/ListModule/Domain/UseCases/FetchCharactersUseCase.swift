////
//  FetchCharactersUseCase.swift
//  DisneyCharacters
//
//  Created by Tu Adrian Azpi el 13/06/26.
//  
//

protocol FetchCharactersUseCaseProtocol {
    func execute(page: Int) async throws -> CharactersPage
}

final class FetchCharactersUseCase: FetchCharactersUseCaseProtocol {
    private let repository: CharacterRepositoryProtocol

    init(repository: CharacterRepositoryProtocol = CharacterRepository()) {
        self.repository = repository
    }

    func execute(page: Int) async throws -> CharactersPage {
        try await repository.getCharactersBy(page: page)
    }
}
