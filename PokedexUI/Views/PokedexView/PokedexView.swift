//
//  PokedexView.swift
//  PokedexUI
//
//  Created by Bruno Vinicius on 06/02/23.
//

import SwiftUI

struct PokedexView: View {
    
    @ObservedObject var viewModel = PokedexViewModel()
    
    
    var items: [GridItem] {
        return Array(repeating: .init(.adaptive(minimum: 120)), count: 2)
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: items, spacing: 16) {
                    ForEach(viewModel.filteredPokemons) { pokemon in
                        NavigationLink(destination: PokemonView(pokemon: pokemon)
                        ) {
                            PokemonCardView(pokemon: pokemon, index: viewModel.getPokemonIndex(pokemon: pokemon))
                            
                        }
                    }
                }
                .padding(.all, 20)
                .navigationTitle("PokemonUI")
                .navigationBarTitleDisplayMode(.automatic)
            }
            .searchable(text: $viewModel.searchText)
            .disableAutocorrection(true)
        }
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
