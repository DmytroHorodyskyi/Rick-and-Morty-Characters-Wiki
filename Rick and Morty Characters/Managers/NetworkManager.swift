//
//  NetworkManager.swift
//  Rick and Morty Characters
//
//  Created by Dmytro Horodyskyi on 28.12.2024.
//

import Foundation
import Combine

final class NetworkManager {
    
    func fetchCharacters() -> AnyPublisher<CharacterList, Error> {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character")
        else {
            return Fail(error: URLError(.badURL))
                .eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: CharacterList.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
