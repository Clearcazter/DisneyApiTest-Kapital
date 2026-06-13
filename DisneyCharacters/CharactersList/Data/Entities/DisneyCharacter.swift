////
//  DisneyCharacter.swift
//  DisneyCharacters
//
//  Created by Tu Adrian Azpi el 13/06/26.
//  
//

import Foundation

struct DisneyCharacter: Identifiable, Decodable, Hashable {
    let id: Int
    let name: String
    let imageUrl: String?
    let films: [String]
    let tvShows: [String]
    let videoGames: [String]
    let parkAttractions: [String]
    let allies: [String]
    let enemies: [String]
    let sourceUrl: String?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, imageUrl, films, tvShows
        case videoGames, parkAttractions
        case allies, enemies, sourceUrl
    }
}
