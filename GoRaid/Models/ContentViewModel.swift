//
//  ContentViewModel.swift
//  GoRaid
//
//  Created by Andy Cho on 2020-08-10.
//  Copyright © 2020 AcroMace. All rights reserved.
//

import Foundation

final class ContentViewModel: ObservableObject {
    // Query for filtering by the name of the pokemon
    @Published var query: String?

    // The list of all Pokemon
    @Published var allPokemon: [Pokemon] = []
}
