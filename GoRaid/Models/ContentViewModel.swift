//
//  ContentViewModel.swift
//  GoRaid
//
//  Created by Andy Cho on 2020-08-10.
//  Copyright © 2020 AcroMace. All rights reserved.
//

import Foundation

final class ContentViewModel: ObservableObject {
    // The list of all Pokemon
    @Published var allPokemon: [Pokemon] = []
}
