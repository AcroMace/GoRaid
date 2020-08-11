//
//  PokemonRow.swift
//  GoRaid
//
//  Created by Andy Cho on 2020-08-10.
//  Copyright © 2020 AcroMace. All rights reserved.
//

import SwiftUI

struct PokemonRow: View {
    var pokemon: Pokemon

    var body: some View {
        HStack(spacing: 0) {
            pokemon.image
                .padding(.trailing, 8)

            VStack(alignment: .leading) {
                Text(pokemon.name.english)
                    .font(.headline)

                Text(pokemon.type.map({ $0.rawValue }).joined(separator: ", "))
                    .font(.subheadline)
            }

            Spacer()
        }
        .padding(.leading, 16)
        .padding(.trailing, 16)
    }
}

struct PokemonRow_Previews: PreviewProvider {
    static var previews: some View {
        let exeggutor = Pokemon(id: 103,
                                name: Pokemon.Names(english: "Exeggutor",
                                                    japanese: "ナッシー",
                                                    chinese: "椰蛋树",
                                                    french: "Noadkoko"),
                                type: [.grass, .psychic])
        return PokemonRow(pokemon: exeggutor)
            .previewLayout(.fixed(width: 300, height: 100))
    }
}
