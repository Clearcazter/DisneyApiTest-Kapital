////
//  CharacterRepositoryTests.swift
//  DisneyCharacters
//
//  Created by Tu Adrian Azpi el 13/06/26.
//  
//

import XCTest

@testable import DisneyCharacters

final class CharacterRepositoryTests: XCTestCase {
    @MainActor
    func testFetchCharacters_savesResultToLocalStore() async throws {
        let remote = MockDisneyService()
        remote.response = DisneyApiResponse(info: PaginatioInfo(totalPages: 5, count: 2, previousPage: nil, nextPage: "page2"),
                                            data: [.mock(id: 1, name: "Mickey Mouse"), .mock(id: 2, name: "Donald Duck")])
        let local = MockCharacterStore()
        let repository = CharacterRepository(remote: remote, local: local)
        // Act
        let page = try await repository.getCharactersBy(page: 1)
        // Asserts
        XCTAssertEqual(page.characters.count, 2)
        XCTAssertTrue(page.hasNextPage)
        XCTAssertEqual(page.page, 1)
        // Asserts para ver la persistencia
        XCTAssertEqual(local.savedCharacters.count, 2, "Debe guardar los personajes en el store local")
        XCTAssertEqual(local.savedPage, 1)
    }
}
