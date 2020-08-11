//
//  Pokemon.swift
//  GoRaid
//
//  Created by Andy Cho on 2020-08-10.
//  Copyright © 2020 AcroMace. All rights reserved.
//

import Foundation

struct Pokemon: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var type: [PokemonType]

    struct Names: Hashable, Codable {
        var english: String
        var japanese: String
        var chinese: String
        var french: String
    }

    enum PokemonType: String, CaseIterable, Codable, Hashable {
        case normal = "Normal"
        case fighting = "Fighting"
        case flying = "Flying"
        case poison = "Poison"
        case ground = "Ground"
        case rock = "Rock"
        case bug = "Bug"
        case ghost = "Ghost"
        case steel = "Steel"
        case fire = "Fire"
        case water = "Water"
        case grass = "Grass"
        case electric = "Electric"
        case psychic = "Psychic"
        case ice = "Ice"
        case dragon = "Dragon"
        case dark = "Dark"
        case fairy = "Fairy"
    }

    // Adapted from SwiftUI tutorial
    // https://developer.apple.com/tutorials/swiftui/creating-and-combining-views
    static func loadPokemon() -> [Pokemon] {
        let filename = "pokedex.json"
        let data: Data
        
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
            else {
                fatalError("Couldn't find \(filename) in main bundle.")
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([Pokemon].self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(Pokemon.self):\n\(error)")
        }
    }
}
