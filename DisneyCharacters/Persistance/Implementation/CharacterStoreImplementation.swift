////
//  CharacterStoreImplementation.swift
//  DisneyCharacters
//
//  Created by Tu Adrian Azpi el 13/06/26.
//  
//

import Foundation
import SwiftData

final class CharacterStoreImplementation: CharacterStoreProtocol {
    private let context: ModelContext
    static let shared = CharacterStoreImplementation(container: PersistenceController.shared)

    init(container: ModelContainer) {
        self.context = ModelContext(container)
    }

    func save(_ characters: [DisneyCharacter], page: Int) throws {
        for character in characters {
            let id = character.id
            let descriptor = FetchDescriptor<LocalCharacter>(predicate: #Predicate { $0.id == id })
            if let existing = try? context.fetch(descriptor).first {
                existing.name = character.name
                existing.imageUrl = character.imageUrl
                existing.films = character.films
                existing.tvShows = character.tvShows
                existing.videoGames = character.videoGames
                existing.savedAt = Date()
            } else {
                context.insert(LocalCharacter(from: character, page: page))
            }
        }
        try context.save()
    }

    func load(page: Int) -> [DisneyCharacter] {
        let descriptor = FetchDescriptor<LocalCharacter>(predicate: #Predicate { $0.page == page },
                                                         sortBy: [SortDescriptor(\.id)])
        return (try? context.fetch(descriptor))?.map { $0.toDomain() } ?? []
    }

    func loadAll() -> [DisneyCharacter] {
        let descriptor = FetchDescriptor<LocalCharacter>(sortBy: [SortDescriptor(\.page), SortDescriptor(\.id)])
        return (try? context.fetch(descriptor))?.map { $0.toDomain() } ?? []
    }
}
