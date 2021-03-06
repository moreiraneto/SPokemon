//
//  IntroWorker.swift
//  SPokemon
//
//  Created by José Moreira on 20/12/2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import Domain
import Data
import RxSwift

class PokemonListWorker: BaseWorker {

    private let limit = 100

    func fetchPokemonList(offset: Int) -> Single<PokemonListModel> {
        let parameter = PaginatedParameter(limit: limit, offset: offset)
        return dataManager.fetchPokemonList(parameter: parameter)
    }
}
