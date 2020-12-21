//
//  BaseViewController.swift
//  SPokemon
//
//  Created by José Moreira on 20/12/2020.
//

import UIKit
import AppTheme
import RxSwift

open class BaseViewController<View: BaseView>: UIViewController, BaseDisplayLogic {

    public let _view: View!
    public let disposeBag = DisposeBag()

    let loadingView = LoadingView()

    public init() {
        self._view = View()
        super.init(nibName: nil, bundle: nil)
        setup()
        bindUI()
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open override func loadView() {
        super.loadView()
        _view.frame = view.frame
        self.view = _view
    }

    override open func viewDidLoad() {
        super.viewDidLoad()
    }

    open func bindUI() {

    }

    override open func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        _view.setupColorsAndStyles()
        setupBaseNavigationBar()
    }

    // MARK: Base display logic

    func displayLoading(viewModel: BaseModel.Loading.ViewModel) {
        loadingView.frame = UIScreen.main.bounds

        UIApplication.shared.keyWindow?.addSubview(loadingView)
        loadingView.startAnimating()
    }

    func displayError(viewModel: BaseModel.Error.ViewModel) {
        loadingView.removeFromSuperview()
    }

    func displayHideLoading(viewModel: BaseModel.Loading.ViewModel) {
        loadingView.removeFromSuperview()
    }

    open func setup() {
        fatalError("Should be overriden")
    }
}
