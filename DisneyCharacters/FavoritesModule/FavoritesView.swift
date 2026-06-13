////
//  FavoritesView.swift
//  DisneyCharacters
//
//  Created by Tu Adrian Azpi el 13/06/26.
//  
//

import SwiftUI

struct FavoritesView: View {
    var body: some View {
        NavigationStack {
            ContentUnavailableView(title: "Aun no haz agrado favoritos",
                                   systemImage: "heart.slash",
                                   description: "Agrega personajes a favoritos desde la lista.")
            .navigationTitle("Favoritos")
        }
    }
}

#Preview {
    FavoritesView()
}
