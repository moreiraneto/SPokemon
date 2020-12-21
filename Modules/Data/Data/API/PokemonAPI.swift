//
//  PokemonAPi.swift
//  Data
//
//  Created by José Moreira on 20/12/2020.
//  Copyright © 2020 Bliss Applications. All rights reserved.
//

import Foundation
import Moya

public enum PokemonAPI {
    case pokemonList(PaginatedParameter)
    case pokemonDetail(id: String)
}

extension PokemonAPI: TargetType {

    public var baseURL: URL {
        URL(string: Bundle.main.infoDictionary?["API_BASE_PATH"]! as! String)!
    }

    public var path: String {
        switch self {
        case .pokemonList:
            return "pokemon"
        case .pokemonDetail(let id):
            return "pokemon/\(id)"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .pokemonList, .pokemonDetail:
            return .get
        }
    }

    public var task: Task {
        switch self {
        case .pokemonList(let parameters):
            return .requestParameters(parameters: try! parameters.asDictionary(), encoding: URLEncoding(destination: .queryString))
        case .pokemonDetail:
            return .requestPlain
        }
    }
}
