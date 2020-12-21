//
//  BasePresenter.swift
//  SPokemon
//
//  Created by José Moreira on 20/12/2020.
//

import Foundation

class BasePresenter: BasePresentationLogic {

    func baseViewController() -> BaseDisplayLogic? {
        assert(false)
        return nil
    }

    func presentLoading(response: BaseModel.Loading.Response) {
        let viewModel = BaseModel.Loading.ViewModel()
        baseViewController()?.displayLoading(viewModel: viewModel)
    }

    func presentError(response: BaseModel.Error.Response) {
        let viewModel = BaseModel.Error.ViewModel(title: "Alert", message: response.message)
        baseViewController()?.displayError(viewModel: viewModel)
    }

    func presentHideLoading(response: BaseModel.Loading.Response) {
        let viewModel = BaseModel.Loading.ViewModel()
        baseViewController()?.displayHideLoading(viewModel: viewModel)
    }
}
