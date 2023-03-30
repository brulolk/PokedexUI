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
    
    static var samplePokemon = Pokemon(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/")
}

struct PokemonDetail: Codable {
    let id: Int
    let name: String
    let locationAreaEncounters: String?
    let types: [PokeTypes]
    
    struct PokeTypes: Codable {
        let type: PokeType
        
        struct PokeType: Codable {
            let name: String
        }
    }
}
