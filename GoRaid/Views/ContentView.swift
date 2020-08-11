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
        PokemonList(pokemons: model.allPokemon)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
