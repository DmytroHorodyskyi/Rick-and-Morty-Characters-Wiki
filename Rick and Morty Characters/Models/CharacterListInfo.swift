//
//  CharacterListInfo.swift
//  Rick and Morty Characters
//
//  Created by Dmytro Horodyskyi on 28.12.2024.
//

struct CharacterListInfo: Decodable {
    
    let count: Int
    let pages: Int
    let next: String?
    let prec: String?
}
