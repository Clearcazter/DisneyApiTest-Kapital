////
//  LocalCharacter.swift
//  DisneyCharacters
//
//  Created by Tu Adrian Azpi el 13/06/26.
//  
//

import Foundation
import SwiftData

@Model
final class LocalCharacter {
    @Attribute(.unique) var id: Int
    var name: String
    var imageUrl: String?
    var films: [String]
    var tvShows: [String]
    var videoGames: [String]
    var parkAttractions: [String]
    var allies: [String]
    var enemies: [String]
    var page: Int
    var savedAt: Date

    init(from character: DisneyCharacter, page: Int) {
        self.id = character.id
        self.name = character.name
        self.imageUrl = character.imageUrl
        self.films = character.films
        self.tvShows = character.tvShows
        self.videoGames = character.videoGames
        self.parkAttractions = character.parkAttractions
        self.allies = character.allies
        self.enemies = character.enemies
        self.page = page
        self.savedAt = Date()
    }

    func toDomain() -> DisneyCharacter {
        DisneyCharacter(id: id,
                        name: name,
                        imageUrl: imageUrl,
                        films: films,
                        tvShows: tvShows,
                        videoGames: videoGames,
                        parkAttractions: parkAttractions,
                        allies: allies,
                        enemies: enemies,
                        sourceUrl: nil)
    }
}
