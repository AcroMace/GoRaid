//
//  PokemonList.swift
//  GoRaid
//
//  Created by Andy Cho on 2020-08-10.
//  Copyright © 2020 AcroMace. All rights reserved.
//

import SwiftUI

struct PokemonList: View {
    var pokemons: [Pokemon]

    var body: some View {
        List(pokemons) { pokemon in
            PokemonRow(pokemon: pokemon)
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

        return PokemonList(pokemons: [pikachu, exeggutor])
    }
}
