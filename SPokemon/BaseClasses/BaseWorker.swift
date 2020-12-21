//
//  BaseWorker.swift
//  SPokemon
//
//  Created by José Moreira on 20/12/2020.
//

import Foundation
import Data

public class BaseWorker {
    public let dataManager = PokemonDataManager(remoteDataSource: PokemonRemoteDataSource())
}
