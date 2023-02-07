//
//  APIRouter.swift
//  HICH
//
//  Created by Sajjad Sarkoobi on 3.09.2022.
//

import Foundation

class APIRouter {
    
    // GET Request
    struct GetPokemons: Request {
        typealias ReturnType = Pokemons
        var path: String = "/pokemon"
        var method: HTTPMethod = .get
        var queryParams: [String : Any]?
        init(queryParams: APIParameters.PokemonParams) {
            self.queryParams = queryParams.asDictionary
        }
    }
    
    struct GetPokemonDetail: Request {
        typealias ReturnType = PokemonDetail
        var path: String = "/pokemon/"
        var method: HTTPMethod = .get
        var queryParams: [String : Any]?
        init(queryParams: APIParameters.PokemonDetailParams) {
            self.queryParams = queryParams.asDictionary
        }
    }
}
