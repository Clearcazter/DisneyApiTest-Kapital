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
            List {
                if viewModel.isLoading {
                    ProgressView("Cargando personajes...")
                        .frame(maxWidth: .infinity)
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                    
                } else if let error = viewModel.errorString {
                    ContentUnavailableView(title: "Sin conexión",
                                           systemImage: "wifi.slash",
                                           description: error)
                    .frame(maxWidth: .infinity)
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                } else {
                    CharacterList
                    if viewModel.isLoadingMoreCharacters {
                        HStack {
                            Spacer()
                            ProgressView()
                            Spacer()
                        }
                        .listRowSeparator(.hidden)
                    }
                }
            }
            .listStyle(.plain)
            .refreshable {
                await viewModel.pullToRefresh()
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
        ForEach(viewModel.characters, id: \.id) { character in
            CharacterCell(character: character)
                .accessibilityAddTraits(.isButton)
                .onTapGesture {
                    router.navigate(to: .detail(character))
                }
                .onAppear {
                    if character.id == viewModel.characters.dropLast(3).last?.id {
                        Task { await viewModel.loadMoreCharacters() }
                    }
                }
        }
    }
}
