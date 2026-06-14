////
//  CharacterListViewModelTests.swift
//  DisneyCharacters
//
//  Created by Tu Adrian Azpi el 13/06/26.
//  
//

import XCTest

@testable import DisneyCharacters

final class CharacterListViewModelTests: XCTestCase {
    @MainActor
    func testLoadInitialData_showsCachedCharacters() async {
        let getCached = MockGetCachedCharactersUseCase()
        getCached.result = [.mock(id: 1, name: "Remy de Ratatoulle"), .mock(id: 2, name: "Linguini")]

        let fetch = MockFetchCharactersUseCase()
        fetch.error = URLError(.notConnectedToInternet)

        let viewModel = CharacterListViewModel(getCachedCharactersUseCase: getCached,
                                               getCharactersUseCase: fetch)
        // Act
        await viewModel.loadInitialData()
        // Assert
        XCTAssertEqual(viewModel.characters.count, 2, "Debe mostrar los datos cacheados")
        XCTAssertNil(viewModel.errorString, "No debe mostrar error si ya hay datos locales")
        XCTAssertFalse(viewModel.isLoading)
    }
}
