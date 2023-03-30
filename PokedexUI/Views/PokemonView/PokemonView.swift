//
//  PokemonView.swift
//  PokedexUI
//
//  Created by Bruno Vinicius on 06/02/23.
//

import SwiftUI

struct PokemonView: View {
    
    let pokemon: Pokemon
    @ObservedObject var viewModel = PokemonViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(.white.opacity(0.95))
                    .shadow(color: .black, radius: 5)
                VStack {
                    Text("about pokemon: \(viewModel.pokemon?.name ?? "")")
                        .foregroundColor(.black)
                    Text("about pokemon: \(pokemon.name)")
                        .foregroundColor(.black)
                    Text("about pokemon: \(pokemon.name)")
                        .foregroundColor(.black)
                }
            }
            .padding(.horizontal, 20)
            .background(Color.red)
            .redacted(reason: viewModel.pokemon == nil ? .placeholder : [])
        }.onAppear {
            viewModel.getPokemon(name: pokemon.name)
        }.foregroundColor(.black)
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView(pokemon: Pokemon.samplePokemon)
    }
}
