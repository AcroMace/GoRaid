//
//  Pokemon.swift
//  GoRaid
//
//  Created by Andy Cho on 2020-08-10.
//  Copyright © 2020 AcroMace. All rights reserved.
//

import Foundation
import SwiftUI

struct Pokemon: Hashable, Codable, Identifiable {
    var id: Int
    var name: Names
    var type: [PokemonType]

    struct Names: Hashable, Codable {
        var english: String
        var japanese: String
        var chinese: String
        var french: String
    }

    enum PokemonType: String, CaseIterable, Codable, Hashable, Identifiable {
        var id: String { UUID().uuidString }

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

extension Pokemon {
    var sprite: Image {
        ImageStore.shared.image(id: id, name: name.english, imageType: .sprite)
    }

    var image: Image {
        ImageStore.shared.image(id: id, name: name.english, imageType: .fullImage)
    }
}

final class ImageStore {
    enum ImageType: CaseIterable, Hashable {
        case sprite
        case fullImage
    }

    typealias _ImageDictionary = [Int: CGImage]
    fileprivate var images: _ImageDictionary = [:]
    fileprivate var sprites: _ImageDictionary = [:]

    fileprivate static var imageScale = 4
    fileprivate static var spriteScale = 1

    static var shared = ImageStore()

    func image(id: Int, name: String, imageType: ImageType) -> Image {
        let index = _getIndexFor(id: id, imageType: imageType)
        switch (imageType) {
        case .sprite:
            return Image(sprites.values[index], scale: CGFloat(ImageStore.spriteScale), label: Text(String(id)))
        case .fullImage:
            return Image(images.values[index], scale: CGFloat(ImageStore.imageScale), label: Text(String(id)))
        }
    }

    fileprivate func _getIndexFor(id: Int, imageType: ImageType) -> _ImageDictionary.Index {
        switch (imageType) {
        case .sprite:
            if let index = sprites.index(forKey: id) { return index }
            let filename = "sprites/\(String(format: "%03d", id))MS"
            sprites[id] = ImageStore.loadImage(filename: filename)
            return sprites.index(forKey: id)!
        case .fullImage:
            if let index = images.index(forKey: id) { return index }
            let filename = "images/\(String(format: "%03d", id))"
            images[id] = ImageStore.loadImage(filename: filename)
            return images.index(forKey: id)!
        }
    }

    static func loadImage(filename: String) -> CGImage {
        guard
            let url = Bundle.main.url(forResource: filename, withExtension: "png"),
            let imageSource = CGImageSourceCreateWithURL(url as NSURL, nil),
            let image = CGImageSourceCreateImageAtIndex(imageSource, 0, nil)
        else {
            fatalError("Couldn't load image \(filename).png from main bundle.")
        }
        return image
    }
}
