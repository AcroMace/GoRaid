//
//  PokemonList.swift
//  GoRaid
//
//  Created by Andy Cho on 2020-08-10.
//  Copyright © 2020 AcroMace. All rights reserved.
//

import SwiftUI

struct PokemonList: View {
    var pokemonsToDisplay: [Pokemon]
    @Binding var allPokemon: [Pokemon]

    var body: some View {
        List(pokemonsToDisplay) { pokemon in
            NavigationLink(destination: PokemonDetail(pokemon: pokemon, allPokemon: self.$allPokemon)) {
                PokemonRow(pokemon: pokemon)
            }
        }
    }
}

struct PokemonList_Previews: PreviewProvider {
    static var previews: some View {
        let pikachu = Pokemon(id: 25,
                              name: Pokemon.Names(english: "Pikachu",
                                                  japanese: "ピカチュウ",
                                                  chinese: "皮卡丘",
                                                  french: "Pikachu"),
                              type: [.electric])
        let exeggutor = Pokemon(id: 103,
                                name: Pokemon.Names(english: "Exeggutor",
                                                    japanese: "ナッシー",
                                                    chinese: "椰蛋树",
                                                    french: "Noadkoko"),
                                type: [.grass, .psychic])

        return PokemonList(pokemonsToDisplay: [pikachu, exeggutor], allPokemon: .constant([]))
    }
}
