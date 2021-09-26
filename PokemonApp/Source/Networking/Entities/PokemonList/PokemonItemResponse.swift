//
//  PokemonItemResponse.swift
//  PokemonApp
//
//  Created by Gabriel Lopes Ferreira on 05/03/21.
//

import Foundation

struct PokemonItemResponse: Codable {
    let types: [PokemonItemTypeResponse]
    let sprites: PokemonSpriteResponse
    
    private enum CodingKeys: String, CodingKey {
        case types
        case sprites
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        types = try container.decode([PokemonItemTypeResponse].self, forKey: .types)
        sprites = try container.decode(PokemonSpriteResponse.self, forKey: .sprites)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(types, forKey: .types)
        try container.encode(sprites, forKey: .sprites)
        
    }
}

struct PokemonItemTypeResponse: Codable {
    let slot: Int
    let type: TypeResponse
}

struct TypeResponse: Codable {
    let name: String
    let url: String
}

struct PokemonSpriteResponse: Codable {
    let other: OtherSpriteResponse
}

struct OtherSpriteResponse: Codable {
    let officialArtwork: OfficialArtwokResponse
    
    private enum CodingKeys: String, CodingKey {
        case officialArtwork = "official-artwork"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        officialArtwork = try container.decode(OfficialArtwokResponse.self, forKey: .officialArtwork)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(officialArtwork, forKey: .officialArtwork)
    }

}

struct OfficialArtwokResponse: Codable {
    let frontDefault: String
    
    private enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}
