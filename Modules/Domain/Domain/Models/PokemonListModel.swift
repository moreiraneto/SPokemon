//
//  PokemonListModel.swift
//  Domain
//
//  Created by José Moreira on 20/12/2020.
//  Copyright © 2020 Bliss Applications. All rights reserved.
//

import Foundation

public struct PokemonListModel: Codable {
    public let count: Int
    public let next: String?
    public let previous: String?
    public let results: [PokemonModel]
}
