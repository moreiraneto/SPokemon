//
//  PokemonDataManager.swift
//  Data
//
//  Created by José Moreira on 20/12/2020.
//  Copyright © 2020 Bliss Applications. All rights reserved.
//

import Domain
import RxSwift

public protocol PokemonRepository {
    func fetchPokemonList(parameter: PaginatedParameter) -> Single<PokemonListModel>
    func fetchPokemonDetail(id: String) -> Single<PokemonDetailModel>
}

public class PokemonDataManager {

    private let remoteDataSource: PokemonRepository

    public init(remoteDataSource: PokemonRepository) {
        self.remoteDataSource = remoteDataSource
    }

    public func fetchPokemonList(parameter: PaginatedParameter) -> Single<PokemonListModel> {
        remoteDataSource.fetchPokemonList(parameter: parameter)
    }

    public func fetchPokemonDetail(id: String) -> Single<PokemonDetailModel> {
        remoteDataSource.fetchPokemonDetail(id: id)
    }
}
