//
//  PokemonRemoteDataSource.swift
//  Data
//
//  Created by José Moreira on 20/12/2020.
//  Copyright © 2020 Bliss Applications. All rights reserved.
//

import RxSwift
import Domain

public struct PokemonRemoteDataSource: PokemonRepository {

    public init() {}

    public func fetchPokemonList(parameter: PaginatedParameter) -> Single<PokemonListModel> {
        NetworkManager.shared.fetchData(fromApi: PokemonAPI.pokemonList(parameter))
    }

    public func fetchPokemonDetail(id: String) -> Single<PokemonDetailModel> {
        NetworkManager.shared.fetchData(fromApi: PokemonAPI.pokemonDetail(id: id))
    }
}
