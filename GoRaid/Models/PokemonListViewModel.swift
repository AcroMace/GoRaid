//
//  PokemonListViewModel.swift
//  GoRaid
//
//  Created by Andy Cho on 2020-08-10.
//  Copyright © 2020 AcroMace. All rights reserved.
//

import Foundation

final class PokemonListViewModel: ObservableObject {
    // The list of Pokemon to display in PokemonList given the current query
    @Published var displayedPokemons: [Pokemon] = []
}
