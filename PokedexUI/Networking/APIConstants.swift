//
//  APIConstants.swift
//  HICH
//
//  Created by Sajjad Sarkoobi on 3.09.2022.
//

import Foundation

final class APIConstants {
    static var basedURL: String = "https://pokeapi.co/api/v2/"
    static var spriteURL: String = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/"
}

enum HTTPHeaderField: String {
    case authentication = "Authentication"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case authorization = "Authorization"
}

enum ContentType: String {
    case json = "application/json"
}
