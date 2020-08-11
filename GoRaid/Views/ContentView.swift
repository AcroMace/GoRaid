//
//  ContentView.swift
//  GoRaid
//
//  Created by Andy Cho on 2020-08-10.
//  Copyright © 2020 AcroMace. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model: ContentViewModel
    @State private var query: String?

    var body: some View {
        VStack {
            SearchBar(query: $query)

            if query != nil && query!.count > 0 {
                PokemonList(pokemons: model.allPokemon.filter({ $0.name.english.lowercased().contains(query!.lowercased()) }))
            } else {
                PokemonList(pokemons: model.allPokemon)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
