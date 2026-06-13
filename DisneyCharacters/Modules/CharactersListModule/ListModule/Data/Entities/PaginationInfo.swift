////
//  PaginationInfo.swift
//  DisneyCharacters
//
//  Created by Tu Adrian Azpi el 13/06/26.
//  
//

import Foundation

struct PaginatioInfo: Decodable {
    let totalPages: Int
    let count: Int
    let previousPage: String?
    let nextPage: String?
}
