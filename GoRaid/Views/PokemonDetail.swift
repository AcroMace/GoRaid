//
//  PokemonDetail.swift
//  GoRaid
//
//  Created by Andy Cho on 2020-08-10.
//  Copyright © 2020 AcroMace. All rights reserved.
//

import SwiftUI

struct PokemonDetail: View {
    var pokemon: Pokemon

    var body: some View {
        VStack {
            pokemon.image
                .padding()

            Text(pokemon.type.map({ $0.rawValue }).joined(separator: ", "))
                .font(.headline)

            Text("Weak against")
                .font(.callout)
                .italic()
                .padding(.top)
        }
        .navigationBarTitle(Text(pokemon.name.english), displayMode: .inline)
    }
}

struct PokemonDetail_Previews: PreviewProvider {
    static var previews: some View {
        let exeggutor = Pokemon(id: 103,
                                name: Pokemon.Names(english: "Exeggutor",
                                                    japanese: "ナッシー",
                                                    chinese: "椰蛋树",
                                                    french: "Noadkoko"),
                                type: [.grass, .psychic])
        return PokemonDetail(pokemon: exeggutor)
    }
}
