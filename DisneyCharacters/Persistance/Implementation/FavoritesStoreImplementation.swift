////
//  FavoritesStoreImplementation.swift
//  DisneyCharacters
//
//  Created by Tu Adrian Azpi el 13/06/26.
//  
//

import Foundation
import SwiftData

final class FavoritesStoreImplementation: FavoritesStoreProtocol {
    private let context: ModelContext
    static let shared = FavoritesStoreImplementation(container: PersistenceController.shared)

    init(container: ModelContainer) {
            self.context = ModelContext(container)
        }

    func add(_ character: DisneyCharacter) throws {
        guard !isFavorite(character) else { return }
        let favorite = FavoriteCharacter(from: character)
        context.insert(favorite)
        try context.save()
    }

    func remove(_ character: DisneyCharacter) throws {
        let id = character.id
        let descriptor = FetchDescriptor<FavoriteCharacter>(predicate: #Predicate { $0.id == id })
        guard let characterFound = try? context.fetch(descriptor).first else {
            return
        }
        context.delete(characterFound)
        try context.save()
    }

    func isFavorite(_ character: DisneyCharacter) -> Bool {
        let id = character.id
        let descriptor = FetchDescriptor<FavoriteCharacter>(predicate: #Predicate { $0.id == id })
        return (try? context.fetch(descriptor).first) != nil
    }

    func all() -> [DisneyCharacter] {
        let descriptor = FetchDescriptor<FavoriteCharacter>(sortBy: [SortDescriptor(\.addedAt, order: .reverse)])
        return (try? context.fetch(descriptor))?.map { $0.toDomain() } ?? []
    }
}
