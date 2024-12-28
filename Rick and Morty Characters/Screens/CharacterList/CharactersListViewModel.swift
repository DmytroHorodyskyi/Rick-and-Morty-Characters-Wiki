//
//  CharacterListViewModel.swift
//  Rick and Morty Characters
//
//  Created by Dmytro Horodyskyi on 28.12.2024.
//

import Foundation
import Combine

final class CharacterListViewModel: CharacterListViewModelProtocol {
        
    @Published var sortedCharacters: [Character] = []
    @Published var isLoading: Bool = false
    var isSortedAscending: Bool = true {
        didSet {
            sortAndSaveCharacters(sortedCharacters)
        }
    }
    private let networkManager = NetworkManager()
    private var cancellables: Set<AnyCancellable> = []
    
    private func sortAndSaveCharacters(_ characters: [Character]) {
        sortedCharacters = characters.sorted(by: { isSortedAscending ? $0.name < $1.name : $0.name > $1.name })
    }
    
    func loadCharactersList() {
        isLoading = true
        networkManager.fetchCharacters()
            .sink(
                receiveCompletion: { [weak self] status in
                    self?.isLoading = false
                },
                receiveValue: { [weak self] characterList in
                    self?.sortAndSaveCharacters(characterList.results)
                })
            .store(in: &cancellables)
    }
}
