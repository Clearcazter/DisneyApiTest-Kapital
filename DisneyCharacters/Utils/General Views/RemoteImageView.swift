////
//  RemoteImageView.swift
//  DisneyCharacters
//
//  Created by Tu Adrian Azpi el 13/06/26.
//  
//

import SwiftUI

struct RemoteImageView: View {
    let urlString: String?
    var maxHeight: CGFloat = 300
    var iconSize: CGFloat = 80
    
    var body: some View {
        AsyncImage(url: URL(string: urlString ?? "")) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: maxHeight)
                    .cornerRadius(8)
                    .padding()
            case .failure, .empty:
                Image(systemName: "person.fill")
                    .font(.system(size: iconSize))
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, maxHeight: maxHeight)
            default:
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: maxHeight)
            }
        }
        .frame(maxWidth: .infinity)
    }
}
