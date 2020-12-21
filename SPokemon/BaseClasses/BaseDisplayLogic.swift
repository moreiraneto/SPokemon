//
//  BaseDisplayLogic.swift
//  SPokemon
//
//  Created by José Moreira on 20/12/2020.
//

import Foundation

protocol BaseDisplayLogic: class {
    func displayLoading(viewModel: BaseModel.Loading.ViewModel)
    func displayHideLoading(viewModel: BaseModel.Loading.ViewModel)
    func displayError(viewModel: BaseModel.Error.ViewModel)
}

