//
//  BaseInteractor.swift
//  SPokemon
//
//  Created by José Moreira on 20/12/2020.
//

import RxSwift

class BaseInteractor {

    var disposeBag = DisposeBag()

    init(){}

    func basePresenter() -> BasePresentationLogic? {
        assert(false)
        return nil
    }

    func presentError(error: Error) {
        let response = BaseModel.Error.Response(message: error.localizedDescription)
        basePresenter()?.presentError(response: response)
    }

    func presentLoading() {
        let response = BaseModel.Loading.Response()
        basePresenter()?.presentLoading(response: response)
    }

    func presentHideLoading() {
        let response = BaseModel.Loading.Response()
        basePresenter()?.presentHideLoading(response: response)
    }
}
