////
//  FavoritesView.swift
//  DisneyCharacters
//
//  Created by Tu Adrian Azpi el 13/06/26.
//  
//

import SwiftUI

struct FavoritesView: View {
    @StateObject private var viewModel = FavoritesViewModel()

    var body: some View {
        NavigationStack {
            Group {
                if viewModel.favorites.isEmpty {
                    ContentUnavailableView(title: "Aun no haz agrado favoritos",
                                           systemImage: "heart.slash",
                                           description: "Agrega personajes a favoritos desde la lista.")
                } else {
                    CharacterListView(characters: viewModel.favorites,
                                      onDelete: { character in viewModel.remove(character)})
                }
            }
            .navigationTitle("Favoritos")
            .onAppear {
                viewModel.loadFavorites()
            }
        }
    }
}

#Preview {
    FavoritesView()
}
