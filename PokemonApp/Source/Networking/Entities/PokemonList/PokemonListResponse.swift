//
//  PokemonListResponse.swift
//  PokemonApp
//
//  Created by Gabriel Lopes Ferreira on 05/03/21.
//

import Foundation

struct PokemonListResponse: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [PokemonListItemResponse]
}

struct PokemonListItemResponse: Codable {
    let name: String
    let url: String
}
