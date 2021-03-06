//
//  PokemonDetailModels.swift
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
import RxDataSources

enum PokemonDetail {

    enum Detail {
        struct Request {
        }

        struct Response {
            let pokemonDetail: PokemonDetailModel
        }

        struct ViewModel {
            let pokemonDetail: [TableSection]

            struct HeaderView {
                let imageUrl: String
            }
        }
    }
}

extension PokemonDetail {
    struct TableSection {
        let section: SectionItem
        let items: [TableItem]
    }

    enum SectionItem: IdentifiableType, Hashable {
        typealias Identity = String

        case abilities(title: String)
        case stats(title: String)

        var identity: String {
            switch self {
            case .abilities:
                return "abilitiesSection"
            case .stats:
                return "statsSection"
            }
        }

        var title: String {
            switch self {
            case .abilities(let title), .stats(let title):
                return title
            }
        }
    }

    enum TableItem: IdentifiableType, Hashable {

        typealias Identity = String

        case ability(name: String)
        case stats(name: String, value: String)

        var identity: String {
            switch self {
            case .ability(let name):
                return "pokemonItem_\(name)"
            case .stats(let name, _):
                return "pokemonItem_\(name)"
            }
        }
    }
}
