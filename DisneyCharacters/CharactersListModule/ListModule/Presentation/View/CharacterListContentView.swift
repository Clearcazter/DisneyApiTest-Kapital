//
//  ContentView.swift
//  DisneyCharacters
//
//  Created by Adrian Azpi on 13/06/26.
//

import SwiftUI

struct CharacterListContentView: View {
    @StateObject private var viewModel = CharacterListViewModel()
    @StateObject private var router = CharactersRouter()

    var body: some View {
        NavigationStack(path: $router.path) {
            Group {
                if viewModel.isLoading {
                    ProgressView("Cargando tus personajes favoritos....")
                } else if let error = viewModel.errorString {
                    ContentUnavailableView(title: "Error al cargar",
                                           systemImage: "wifi.slash",
                                           description: error)
                } else {
                    CharacterList
                }
            }
            .navigationTitle("Personajes")
            .navigationDestination(for: CharactersRoute.self) { route in
                switch route {
                case .detail(let character):
                   CharacterDetailView(character: character)
                }
            }
            .task {
                await viewModel.loadInitialData()
            }
        }
    }
    
    private var CharacterList: some View {
        List {
            ForEach(viewModel.characters, id: \.id) { character in
                CharacterCell(character: character)
                    .onTapGesture {
                        router.navigate(to: .detail(character))
                    }
                    .onAppear {
                        if character.id == viewModel.characters.dropLast(3).last?.id {
                            Task { await viewModel.loadMoreCharacters() }
                        }
                    }
            }
            if viewModel.isLoadingMoreCharacters {
                HStack {
                    Spacer()
                    ProgressView()
                    Spacer()
                }
                .listRowSeparator(.hidden)
            }
        }
        .listStyle(.plain)
    }
}
