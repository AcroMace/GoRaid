//
//  SuperEffectiveChecks.swift
//  GoRaid
//
//  Created by Andy Cho on 2020-08-10.
//  Copyright © 2020 AcroMace. All rights reserved.
//

import Foundation

/**
 * Hard-coded type checks from:
 * https://www.gamepress.gg/pokemongo/pokemon-go-type-chart
 */

class SuperEffectiveChecks {
    static func strongAgainst(type: Pokemon.PokemonType) -> [Pokemon.PokemonType] {
        switch (type) {
        case .normal:
            return []
        case .fighting:
            return [.dark, .ice, .normal, .rock, .steel]
        case .flying:
            return [.bug, .fighting, .grass]
        case .poison:
            return [.grass, .fairy]
        case .ground:
            return [.electric, .fire, .poison, .rock, .steel]
        case .rock:
            return [.bug, .fire, .flying, .ice]
        case .bug:
            return [.dark, .grass, .psychic]
        case .ghost:
            return [.ghost, .psychic]
        case .steel:
            return [.fairy, .ice, .rock]
        case .fire:
            return [.bug, .grass, .ice, .steel]
        case .water:
            return [.fire, .ground, .rock]
        case .grass:
            return [.ground, .rock, .water]
        case .electric:
            return [.flying, .water]
        case .psychic:
            return [.fighting, .poison]
        case .ice:
            return [.dragon, .flying, .grass, .ground]
        case .dragon:
            return [.dragon]
        case .dark:
            return [.ghost, .psychic]
        case .fairy:
            return [.dark, .dragon, .fighting]
        }
    }

    static func weakAgainst(type: Pokemon.PokemonType) -> [Pokemon.PokemonType] {
        switch (type) {
        case .normal:
            return [.fighting]
        case .fighting:
            return [.fairy, .flying, .psychic]
        case .flying:
            return [.electric, .ice, .rock]
        case .poison:
            return [.ground, .psychic]
        case .ground:
            return [.grass, .ice, .water]
        case .rock:
            return [.fighting, .grass, .ground, .steel, .water]
        case .bug:
            return [.fire, .flying, .rock]
        case .ghost:
            return [.dark, .ghost]
        case .steel:
            return [.fighting, .fire, .ground]
        case .fire:
            return [.ground, .rock, .water]
        case .water:
            return [.electric, .grass]
        case .grass:
            return [.bug, .fire, .flying, .ice, .poison]
        case .electric:
            return [.ground]
        case .psychic:
            return [.bug, .dark, .ghost]
        case .ice:
            return [.fighting, .fire, .rock, .steel]
        case .dragon:
            return [.dragon, .fairy, .ice]
        case .dark:
            return [.bug, .fighting, .fairy]
        case .fairy:
            return [.poison, .steel]
        }
    }

    static func strongAgainst(types: [Pokemon.PokemonType]) -> [Pokemon.PokemonType] {
        return Array(Set(types.map({ strongAgainst(type: $0) }).joined()))
    }

    static func weakAgainst(types: [Pokemon.PokemonType]) -> [Pokemon.PokemonType] {
        return Array(Set(types.map({ weakAgainst(type: $0) }).joined()))
    }
}
