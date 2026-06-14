////
//  RemoteImageView.swift
//  DisneyCharacters
//
//  Created by Tu Adrian Azpi el 13/06/26.
//  
//

import SwiftUI

struct CachedAsyncImage: View {
    let url: URL?

    @State private var uiImage: UIImage?
    @State private var failed = false

    var body: some View {
        Group {
            if let uiImage {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
            } else if failed {
                Image(systemName: "person.fill")
                    .foregroundStyle(.secondary)
            } else {
                ProgressView()
                    .task { await load() }
            }
        }
    }

    private func load() async {
        guard let url else {
            failed = true
            return
        }
        do {
            let data = try await ImageCacheLoader.shared.data(from: url)
            if let image = UIImage(data: data) {
                await MainActor.run { uiImage = image }
            } else {
                await MainActor.run { failed = true }
            }
        } catch {
            await MainActor.run { failed = true }
        }
    }
}
