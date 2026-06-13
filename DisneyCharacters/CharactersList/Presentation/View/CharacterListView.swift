//
//  ContentView.swift
//  DisneyCharacters
//
//  Created by Adrian Azpi on 13/06/26.
//

import SwiftUI

struct CharacterListView: View {
    @StateObject private var viewModel = CharacterListViewModel()

    var body: some View {
        VStack {
            Image(systemName: "sun")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}
