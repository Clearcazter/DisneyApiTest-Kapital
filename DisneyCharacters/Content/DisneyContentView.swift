////
//  DisneyContentView.swift
//  DisneyCharacters
//
//  Created by Tu Adrian Azpi el 13/06/26.
//
//

import SwiftUI

struct DisneyContentView: View {
    var body: some View {
        TabView {
            CharacterListContentView()
                .tabItem {
                    Label("Personajes", systemImage: "person.2.fill")
                }
            FavoritesView()
                .tabItem {
                    Label("Favoritos", systemImage: "heart.fill")
                }
        }
    }
}
