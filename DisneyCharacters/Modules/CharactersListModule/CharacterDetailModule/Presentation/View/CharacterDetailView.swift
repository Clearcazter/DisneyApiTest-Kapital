////
//  CharacterDetailView.swift
//  DisneyCharacters
//
//  Created by Tu Adrian Azpi el 13/06/26.
//
//

import SwiftUI

struct CharacterDetailView: View {
    @StateObject private var viewModel: CharacterDetailViewModel
    
    init(character: DisneyCharacter) {
        _viewModel = StateObject(wrappedValue: CharacterDetailViewModel(character: character))
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                CachedAsyncImage(url: viewModel.character.imageURL)
                    .accessibilityHidden(true)
                infoSection
            }
        }
        .navigationTitle(viewModel.character.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                FavoriteButton(isFavorite: $viewModel.isFavorite) {
                    viewModel.toggleFavorite()
                }
            }
        }
    }
    
    private var infoSection: some View {
        VStack(alignment: .leading, spacing: 20) {
            if !viewModel.character.films.isEmpty {
                AppearanceSection(title: "Películas",
                                  icon: "film.fill",
                                  items: viewModel.character.films)
            }
            if !viewModel.character.tvShows.isEmpty {
                AppearanceSection(title: "Series",
                                  icon: "tv.fill",
                                  items: viewModel.character.tvShows)
            }
            if !viewModel.character.videoGames.isEmpty {
                AppearanceSection(title: "Videojuegos",
                                  icon: "gamecontroller.fill",
                                  items: viewModel.character.videoGames)
            }
            if !viewModel.character.parkAttractions.isEmpty {
                AppearanceSection(title: "Atracciones",
                                  icon: "map.fill",
                                  items: viewModel.character.parkAttractions)
            }
            if !viewModel.character.allies.isEmpty {
                AppearanceSection(title: "Aliados",
                                  icon: "person.2.fill",
                                  items: viewModel.character.allies)
            }
            if !viewModel.character.enemies.isEmpty {
                AppearanceSection(title: "Enemigos",
                                  icon: "bolt.fill",
                                  items: viewModel.character.enemies)
            }
        }
        .padding(16)
    }
}
