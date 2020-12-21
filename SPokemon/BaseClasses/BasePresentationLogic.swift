//
//  BasePresentationLogic.swift
//  SPokemon
//
//  Created by José Moreira on 20/12/2020.
//

import Foundation

protocol BasePresentationLogic: class {
    func presentLoading(response: BaseModel.Loading.Response)
    func presentHideLoading(response: BaseModel.Loading.Response)
    func presentError(response: BaseModel.Error.Response)
}
