//
//  PokemonViewModel.swift
//  PokedexUI
//
//  Created by Bruno Vinicius on 06/02/23.
//

import Combine

class PokemonViewModel: ObservableObject {
    
    @Published var pokemon: PokemonDetail?
    private var loaded: Bool = false
    private var cancelable: Set<AnyCancellable> = []
    
    //GET Method
    func getPokemon(name: String) {
        APIClient.dispatch(
            APIRouter.GetPokemonDetail(queryParams: APIParameters.PokemonDetailParams(name: name)))
        .sink { _ in
        } receiveValue: { [weak self] pokemon in
            Log.info("details pokemon id:-> \(pokemon.id)")
            self?.pokemon = pokemon
        }.store(in: &cancelable)
    }
}
