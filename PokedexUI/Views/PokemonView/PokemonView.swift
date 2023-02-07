//
//  PokemonView.swift
//  PokedexUI
//
//  Created by Bruno Vinicius on 06/02/23.
//

import SwiftUI

struct PokemonView: View {
    
    let pokemon: Pokemon
    
    var body: some View {
        Text("about pokemon: \(pokemon.name)")
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView(pokemon: Pokemon(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon-species/1/"))
    }
}
