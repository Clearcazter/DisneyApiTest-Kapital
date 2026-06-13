////
//  DisneyApiResponse.swift
//  DisneyCharacters
//
//  Created by Tu Adrian Azpi el 13/06/26.
//  
//

import Foundation

struct DisneyApiResponse: Decodable {
    let info: PaginatioInfo
    let data: [DisneyCharacter]
}
