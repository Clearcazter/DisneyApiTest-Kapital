////
//  ImageCacheLoader.swift
//  DisneyCharacters
//
//  Created by Tu Adrian Azpi el 13/06/26.
//  
//

import Foundation

final class ImageCacheLoader {
    static let shared = ImageCacheLoader()

    private let session: URLSession

    private init() {
        let cache = URLCache(memoryCapacity: 50 * 1024 * 1024,
                             diskCapacity: 200 * 1024 * 1024)
        let config = URLSessionConfiguration.default
        config.urlCache = cache
        self.session = URLSession(configuration: config)
    }

    func data(from url: URL) async throws -> Data {
        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
        let (data, _) = try await session.data(for: request)
        return data
    }
}
