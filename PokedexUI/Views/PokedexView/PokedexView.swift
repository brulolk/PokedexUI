//
//  PokedexView.swift
//  PokedexUI
//
//  Created by Bruno Vinicius on 06/02/23.
//

import SwiftUI

struct PokedexView: View {
    
    @StateObject var viewModel = PokedexViewModel()
    
    private let adaptiveColumns = [
        GridItem(.flexible()), GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 20) {
                    ForEach(viewModel.pokemons) { pokemon in
                        NavigationLink(destination: PokemonView()
                        ) {
                            PokemonCardView(pokemon: pokemon, index: viewModel.getPokemonIndex(pokemon: pokemon))
                        }
                    }
                }.padding(.all, 20)
                .navigationTitle("PokemonUI")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
        .environmentObject(viewModel)
        .onAppear {
            viewModel.getPokemons()
        }
    }
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}
