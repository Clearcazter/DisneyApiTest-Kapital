////
//  FavoriteCharacterListView.swift
//  DisneyCharacters
//
//  Created by Tu Adrian Azpi el 13/06/26.
//  
//

import SwiftUI

struct CharacterListView: View {
    let characters: [DisneyCharacter]
    var onDelete: (DisneyCharacter) -> Void
    
    var body: some View {
        List {
            ForEach(characters) { character in
                CharacterCell(character: character)
                    .swipeActions(edge: .trailing) {
                        Button(role: .destructive) {
                            onDelete(character)
                        } label: {
                            Label("Eliminar", systemImage: "heart.slash")
                        }
                    }
            }
        }
        .listStyle(.plain)
    }
}
