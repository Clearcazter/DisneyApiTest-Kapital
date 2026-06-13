////
//  FavoriteButton.swift
//  DisneyCharacters
//
//  Created by Tu Adrian Azpi el 13/06/26.
//  
//

import SwiftUI

import SwiftUI

struct FavoriteButton: View {
    @Binding var isFavorite: Bool
    var onToggle: () -> Void
    
    var body: some View {
        Button {
            onToggle()
        } label: {
            Image(systemName: isFavorite ? "heart.fill" : "heart")
                .foregroundStyle(isFavorite ? .red : .secondary)
                .font(.title2)
                .animation(.spring(duration: 0.3),
                           value: isFavorite)
        }
    }
}

#Preview {
    FavoriteButton(isFavorite: .constant(true)) {
        debugPrint("Favorite Tapped")
    }
}
