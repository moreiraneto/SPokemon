//
//  IntroModels.swift
//  SPokemon
//
//  Created by José Moreira on 20/12/2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import Foundation
import RxDataSources
import Domain

enum PokemonList {
    // MARK: Use cases
    enum List {
        struct Request {

        }

        struct Response {
            let pokemonList: [PokemonModel]
        }

        struct ViewModel {
            let pokemonList: TableSection
            let title: String
        }
    }

    enum SelectedPokemon {
        struct Request {
            let name: String
        }

        struct Response {
        }

        struct ViewModel {
        }
    }
}

extension PokemonList {
    struct TableSection {
        let title: SectionItem
        let items: [TableItem]
    }

    enum SectionItem: IdentifiableType, Hashable {
        typealias Identity = String

        case pokemon

        var identity: String {
            return "pokemonSection"
        }

        var title: String { "" }
    }

    enum TableItem: IdentifiableType, Hashable {

        typealias Identity = String

        case pokemon(name: String, imageUrl: String)

        var identity: String {
            switch self {
            case .pokemon(let name, _):
                return "pokemonItem_\(name)"
            }
        }
    }
}