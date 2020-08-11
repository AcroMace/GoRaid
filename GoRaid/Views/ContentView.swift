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

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(query: $model.query)
                    .padding(.leading, 8)
                    .padding(.trailing, 8)

                if model.query != nil && model.query!.count > 0 {
                    PokemonList(pokemons: model.allPokemon.filter({ $0.name.english.lowercased().contains(model.query!.lowercased()) }))
                } else {
                    PokemonList(pokemons: model.allPokemon)
                }
            }
            .navigationBarTitle(Text("Go Raid"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
