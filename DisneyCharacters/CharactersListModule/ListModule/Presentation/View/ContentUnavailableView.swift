////
//  ContentUnavailableView.swift
//  DisneyCharacters
//
//  Created by Tu Adrian Azpi el 13/06/26.
//  
//

import SwiftUI

struct ContentUnavailableView: View {
    let title: String
    let systemImage: String
    let description: String
    
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: systemImage)
                .font(.system(size: 48))
                .foregroundColor(.secondary)
                .padding(.top, 200)
            Text(title)
                .font(.title3)
                .fontWeight(.semibold)
            Text(description)
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            Spacer()
        }
    }
}

#Preview {
    ContentUnavailableView(title: "Error al cargar la los personajes",
                           systemImage: "wifi.slash",
                           description: "Hubo un problema por favor intentalo de nuevo")
}
