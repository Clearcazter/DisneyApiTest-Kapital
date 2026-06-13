//
//  DisneyCharactersApp.swift
//  DisneyCharacters
//
//  Created by Adrian Azpi on 13/06/26.
//

import SwiftUI
import SwiftData

@main
struct DisneyCharactersApp: App {
    var body: some Scene {
        WindowGroup {
            DisneyContentView()
                .modelContainer(PersistenceController.shared)
        }
    }
}
