//
//  PokemonCardView.swift
//  PokedexUI
//
//  Created by Bruno Vinicius on 06/02/23.
//

import SwiftUI

struct PokemonCardView: View {
    
    let pokemon: Pokemon
    let index: Int
    
    var body: some View {
        ZStack {
            VStack(alignment: .center) {
                Text(pokemon.name.capitalized)
                    .font(.title2).bold().dynamicTypeSize(.large)
                    .padding(.top, 10)
                    .foregroundColor(.white)
                
                AsyncImage(url: URL(string: "\(APIConstants.spriteURL)\(index).png")) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 130, maxHeight: 130)
                        .background(
                            .white
                            .opacity(0.9)
                        )
                        .clipShape(Circle())
                } placeholder: {
                    GifImage("pokeball")
                        .frame(width: 130, height: 130)
                        .clipShape(Circle())
                }
                .padding(.all, 10)
            }
        }
        .cornerRadius(12)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.red.gradient)
                .shadow(color: .gray, radius: 6, x: -5, y: -5)
        )
    }
}

struct PokemonCardView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCardView(pokemon: Pokemon(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon-species/1/"), index: 1)
    }
}
