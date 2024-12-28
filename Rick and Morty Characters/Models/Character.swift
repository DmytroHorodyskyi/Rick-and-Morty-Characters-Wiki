//
//  Character.swift
//  Rick and Morty Characters
//
//  Created by Dmytro Horodyskyi on 28.12.2024.
//

import Foundation

struct Character: Decodable, Identifiable {
    
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: CharacterLocation
    let location: CharacterLocation
    let image: String
    let url: String
    
    var characterStatus: CharacterStatus {
        CharacterStatus(rawValue: status) ?? .unknown
    }
    
    var characterType: String {
        if type.isEmpty {
            return "default"
        } else {
            return type
        }
    }
    
    static var mock: Character {
        .init(
            id: 1,
            name: "Rick Sanchez",
            status: "Alive",
            species: "Human",
            type: "",
            gender: "Male",
            origin: CharacterLocation(
                name: "Earth",
                url: "https://rickandmortyapi.com/api/location/1"
            ),
            location: CharacterLocation(
                name: "Earth",
                url: "https://rickandmortyapi.com/api/location/20"
            ),
            image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
            url: "https://rickandmortyapi.com/api/character/1"
        )
    }
}
