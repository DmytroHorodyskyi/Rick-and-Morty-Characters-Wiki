//
//  CharacterListView.swift
//  Rick and Morty Characters
//
//  Created by Dmytro Horodyskyi on 28.12.2024.
//

import SwiftUI

protocol CharacterListViewModelProtocol: ObservableObject {
    var isLoading: Bool { get }
    var isSortedAscending: Bool { get set }
    var sortedCharacters: [Character] { get }
    func loadCharactersList()
}

struct CharacterListView<ViewModel: CharacterListViewModelProtocol>: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            List(viewModel.sortedCharacters) { character in
                NavigationLink(destination: CharacterDetailsView(character: character)) {
                    HStack {
                        AsyncImageView(url: URL(string: character.image))
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        Text(character.name)
                            .font(.headline)
                    }
                }
            }
            if viewModel.isLoading {
                ProgressView()
            }
        }
        .navigationTitle("Characters")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Sort", systemImage: viewModel.isSortedAscending ? "arrow.up" : "arrow.down") {
                    viewModel.isSortedAscending.toggle()
                }
            }
        }
        .onAppear {
            viewModel.loadCharactersList()
        }
    }
}

#Preview {
    CharacterListView(viewModel: CharacterListViewModel())
}
