////
//  PersistenceController.swift
//  DisneyCharacters
//
//  Created by Tu Adrian Azpi el 13/06/26.
//  
//

import Foundation
import SwiftData


enum PersistenceController {
    static let shared: ModelContainer = {
        let schema = Schema([LocalCharacter.self, FavoriteCharacter.self])
        let config = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        return try! ModelContainer(for: schema, configurations: config)
    }()
}
