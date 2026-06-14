////
//  CharactersRouter.swift
//  DisneyCharacters
//
//  Created by Tu Adrian Azpi el 13/06/26.
//  
//

import Combine

final class CharactersRouter: ObservableObject {
    @Published var path: [CharactersRoute] = []

    func navigate(to route: CharactersRoute) {
        path.append(route)
    }

    func goBack() {
        path.removeLast()
    }

    func goRoot() {
        path.removeAll()
    }
}
