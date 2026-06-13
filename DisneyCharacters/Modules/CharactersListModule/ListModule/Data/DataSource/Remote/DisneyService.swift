////
//  DisneyService.swift
//  DisneyCharacters
//
//  Created by Tu Adrian Azpi el 13/06/26.
//  
//

import Foundation

final class DisneyService: DisneyServiceProtocol {
    static let shared: DisneyService = {
        let cache = URLCache(memoryCapacity: 50 * 1024 * 1024,
                             diskCapacity: 200 * 1024 * 1024)
        let config = URLSessionConfiguration.default
        config.urlCache = cache
        config.requestCachePolicy = .returnCacheDataElseLoad
        let session = URLSession(configuration: config)
        return DisneyService(session: session)
    }()
    
    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    func getCharactersBy(page: Int = 1) async throws -> DisneyApiResponse {
        guard let url = URL(string: "\(PathsEnum.baseUrl.rawValue)/character?page=\(page)&pageSize=20") else {
            throw URLError(.badURL)
        }
        let (data, _) = try await session.data(from: url)
        return try JSONDecoder().decode(DisneyApiResponse.self, from: data)
    }

    func getCharacter(id: Int) async throws -> DisneyCharacter {
        guard let url = URL(string: "\(PathsEnum.baseUrl.rawValue)/character/\(id)") else {
            throw URLError(.badURL)
        }
        var request = URLRequest(url: url)
        request.cachePolicy = .returnCacheDataElseLoad
        let (data, _) = try await session.data(for: request)
        let response = try JSONDecoder().decode(DisneyDetailResponse.self, from: data)
        return response.data
    }
}


