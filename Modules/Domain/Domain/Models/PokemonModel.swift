//
//  PokemonModel.swift
//  Domain
//
//  Created by José Moreira on 20/12/2020.
//  Copyright © 2020 Bliss Applications. All rights reserved.
//

import Foundation

public struct PokemonModel: Codable, Hashable {
    public let name: String
    public let url: String
}
