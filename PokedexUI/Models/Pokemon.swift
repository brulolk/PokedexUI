//
//  Pokemon.swift
//  PokedexUI
//
//  Created by Bruno Vinicius on 06/02/23.
//

import Foundation

struct Pokemons: Codable {
    let results: [Pokemon]
    let count: Int
    let next: String?
    let previous: String?
}

struct Pokemon: Codable, Hashable, Identifiable {
    let id = UUID()
    let name: String
    let url: String
}

struct PokemonDetail: Codable {
    let id: Int
    let name: String
    let locationAreaEncounters: String
    let sprite: Sprite
    let types: [PokeType]
    
    struct PokeType: Codable {
        let name: String
    }
    
    struct Sprite: Codable {
        let other: OtherSprites
        
        struct OtherSprites: Codable {
            let officialArtWork: OfficialArtwork
            
            struct OfficialArtwork: Codable {
                let frontDefault: String
            }
        }
    }
}
