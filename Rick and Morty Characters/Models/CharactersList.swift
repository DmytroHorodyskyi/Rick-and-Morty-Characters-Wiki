//
//  CharacterList.swift
//  Rick and Morty Characters
//
//  Created by Dmytro Horodyskyi on 28.12.2024.
//

struct CharacterList: Decodable {
    
    let info: CharacterListInfo
    let results: [Character]
}
