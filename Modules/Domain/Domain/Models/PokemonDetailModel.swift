//
//  PokemonDetailModel.swift
//  Domain
//
//  Created by José Moreira on 20/12/2020.
//  Copyright © 2020 Bliss Applications. All rights reserved.
//

import Foundation

public struct PokemonDetailModel: Codable, Hashable {
    public let abilities: [PokemonAbilityWrapperModel]
    public let sprites: PokemonSpritesModel
    public let stats: [PokemonStatsModel]
}

public struct PokemonAbilityWrapperModel: Codable, Hashable {
    public let ability: PokemonAbilityModel
}

public struct PokemonAbilityModel: Codable, Hashable {
    public let name: String
    public let url: String
}

public struct PokemonSpritesModel: Codable, Hashable {
    public let backDefault: String
    public let backShiny: String
    public let frontDefault: String
    public let frontShiny: String
    public let other: PokemonOtherSpriteModel

    public enum CodingKeys: String, CodingKey {

        case backDefault = "back_default"
        case backShiny = "back_shiny"
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
        case other
    }
}

public struct PokemonOtherSpriteModel: Codable, Hashable {
    public let dreamWorld: PokemonOtherSpriteFrontModel
    public let officialArtwork: PokemonOtherSpriteFrontModel

    public enum CodingKeys: String, CodingKey {
        case dreamWorld = "dream_world"
        case officialArtwork = "official-artwork"
    }
}

public struct PokemonOtherSpriteFrontModel: Codable, Hashable {
    public let frontDefault: String?

    public enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}


public struct PokemonStatsModel: Codable, Hashable {
    public let baseStat: Int
    public let stat: PokemonStatModel

    public enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case stat
    }
}

public struct PokemonStatModel: Codable, Hashable {
    public let name: String
    public let url: String
}
