//
//  CharacterDetailsView.swift
//  Rick and Morty Characters
//
//  Created by Dmytro Horodyskyi on 28.12.2024.
//

import SwiftUI

struct CharacterDetailsView: View {
    
    let character: Character
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImageView(url: URL(string: character.image))
                Text(character.name)
                    .font(.largeTitle)
                    .bold()
                    .padding()
                VStack(spacing: 12) {
                    HStack {
                        Text("Species:")
                            .bold()
                        Text(character.species)
                        Spacer()
                    }
                    .padding(.horizontal)
                    HStack {
                        Text("Type:")
                            .bold()
                        Text(character.characterType)
                        Spacer()
                    }
                    .padding(.horizontal)
                    HStack {
                        Text("Gender:")
                            .bold()
                        Text(character.gender)
                        Spacer()
                    }
                    .padding(.horizontal)
                    HStack {
                        Text("Origin:")
                            .bold()
                        Text(character.origin.name)
                        Spacer()
                    }
                    .padding(.horizontal)
                    HStack {
                        Text("Current location:")
                            .bold()
                        Text(character.location.name)
                        Spacer()
                    }
                    .padding(.horizontal)
                }
            }
            Spacer()
        }
        .navigationTitle("Details")
        .toolbar {
            HStack {
                Spacer()
                Group {
                    Circle()
                        .frame(height: 8)
                    Text(character.status)
                        .font(.headline)
                }
                .foregroundColor(character.characterStatus.color)
            }
        }
    }
}


#Preview {
    CharacterDetailsView(
        character: Character.mock
    )
}
