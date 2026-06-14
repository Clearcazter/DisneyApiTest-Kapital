////
//  FavoriteCharacter.swift
//  DisneyCharacters
//
//  Created by Tu Adrian Azpi el 13/06/26.
//  
//

import Foundation
import SwiftData

@Model
final class FavoriteCharacter {
    @Attribute(.unique) var id: Int
    var name: String
    var imageUrl: String?
    var films: [String]
    var tvShows: [String]
    var videoGames: [String]
    var parkAttractions: [String]
    var allies: [String]
    var enemies: [String]
    var addedAt: Date

    init(from character: DisneyCharacter) {
        self.id = character.id
        self.name = character.name
        self.imageUrl = character.imageUrl
        self.films = character.films
        self.tvShows = character.tvShows
        self.videoGames = character.videoGames
        self.parkAttractions = character.parkAttractions
        self.allies = character.allies
        self.enemies = character.enemies
        self.addedAt = Date()
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
                        sourceUrl: nil
        )
    }
}
