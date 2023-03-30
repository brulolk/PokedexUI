//
//  APIParameters.swift
//  HICH
//
//  Created by Sajjad Sarkoobi on 3.09.2022.
//

import Foundation

protocol DictionaryConvertor: Codable {}


//MARK: APIParameters for using in URLrequests
/// Structs that containg all parameters that needed for passing data as body or queary strings to urlrequest
/// it is conforimig to DictionaryConvertor
struct APIParameters{
    
    struct PokemonParams: Encodable  {
        var offset: Int?
        var limit: Int?
    }
}
