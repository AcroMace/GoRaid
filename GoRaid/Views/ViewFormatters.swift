//
//  ViewFormatters.swift
//  GoRaid
//
//  Created by Andy Cho on 2020-08-10.
//  Copyright © 2020 AcroMace. All rights reserved.
//

import Foundation

class ViewFormatter {
    static func formatPokemonTypes(types: [Pokemon.PokemonType]) -> String {
        return types.map({ $0.rawValue }).joined(separator: ", ")
    }
}
