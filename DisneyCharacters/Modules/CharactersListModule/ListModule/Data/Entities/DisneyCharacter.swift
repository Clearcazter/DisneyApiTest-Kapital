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
    
    var primaryAppearance: String? {
        films.first ?? tvShows.first ?? videoGames.first
    }

    var totalAppearances: Int {
        films.count + tvShows.count + videoGames.count
    }
    
    var imageURL: URL? {
        guard let imageUrl, let url = URL(string: imageUrl) else { return nil }
        return url
    }
}
