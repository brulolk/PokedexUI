//
//  PokedexViewModel.swift
//  PokedexUI
//
//  Created by Bruno Vinicius on 06/02/23.
//

import Combine

class PokedexViewModel: ObservableObject {
    
    @Published var pokemons: [Pokemon] = []
    @Published var searchText = ""
    var ended: Bool = false
    private var cancelable: Set<AnyCancellable> = []
    
    var filteredPokemons: [Pokemon] {
        return searchText == "" ? pokemons : pokemons.filter { $0.name.contains(searchText.lowercased()) }
    }
    
    //GET Method
    func getPokemons() {
        APIClient.dispatch(
            APIRouter.GetPokemons(queryParams: APIParameters.PokemonParams(offset: pokemons.count, limit: 1008)))
        .sink { _ in }
        receiveValue: { [weak self] pokemons in
            self?.pokemons += pokemons.results
            self?.ended = pokemons.next != nil
        }.store(in: &cancelable)
    }
    
    // Get the index of a pokemon ( index + 1 = pokemon id)
    func getPokemonIndex(pokemon: Pokemon) -> Int {
        if let index = self.pokemons.firstIndex(of: pokemon) {
            return index + 1
        }
        return 0
    }
}
