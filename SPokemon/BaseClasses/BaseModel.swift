//
//  BaseModel.swift
//  SPokemon
//
//  Created by José Moreira on 20/12/2020.
//

import Foundation

class BaseModel {
}

extension BaseModel {
    enum Loading {
        struct Response {
        }

        struct ViewModel {
        }
    }

    enum Error {
        struct Response {
            let message: String
        }

        struct ViewModel {
            let title: String
            let message: String
        }
    }
}
