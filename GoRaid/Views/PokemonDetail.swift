//
//  PokemonDetail.swift
//  GoRaid
//
//  Created by Andy Cho on 2020-08-10.
//  Copyright © 2020 AcroMace. All rights reserved.
//

import SwiftUI

struct PokemonDetail: View {
    var pokemon: Pokemon
    @Binding var allPokemon: [Pokemon]

    var body: some View {
        let weakAgainst = SuperEffectiveChecks.weakAgainst(types: pokemon.type)

        return VStack {
            pokemon.image
                .padding(.leading, 16)
                .padding(.trailing, 16)

            Text(ViewFormatter.formatPokemonTypes(types: pokemon.type))
                .font(.headline)

            Text("Strong against")
                .font(.callout)
                .italic()
                .padding(.top)

            Text(ViewFormatter.formatPokemonTypes(types: SuperEffectiveChecks.strongAgainst(types: pokemon.type)))
                .font(.headline)

            Text("Weak against")
                .font(.callout)
                .italic()
                .padding(.top)

            Text(ViewFormatter.formatPokemonTypes(types: SuperEffectiveChecks.weakAgainst(types: pokemon.type)))
                .font(.headline)

            // Looks complicated, but basically returns the pokemon if it has a type that's in weakAgainst
            PokemonList(pokemonsToDisplay: allPokemon.filter({ pokemon in
                weakAgainst.reduce(false) { (result, weakAgainstType) -> Bool in
                    result || (pokemon.type.firstIndex(of: weakAgainstType) != nil)
                }
            }), allPokemon: $allPokemon)
        }
        .navigationBarTitle(Text(pokemon.name.english), displayMode: .inline)
    }
}

struct PokemonDetail_Previews: PreviewProvider {
    static var previews: some View {
        let exeggutor = Pokemon(id: 103,
                                name: Pokemon.Names(english: "Exeggutor",
                                                    japanese: "ナッシー",
                                                    chinese: "椰蛋树",
                                                    french: "Noadkoko"),
                                type: [.grass, .psychic])
        return PokemonDetail(pokemon: exeggutor, allPokemon: .constant([]))
    }
}
