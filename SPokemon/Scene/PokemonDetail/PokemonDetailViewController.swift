//
//  PokemonDetailViewController.swift
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
import RxSwift
import RxDataSources

protocol PokemonDetailDisplayLogic: BaseDisplayLogic {
    func displayPokemonDetail(viewModel: PokemonDetail.Detail.ViewModel)
    func displayHeaderView(viewModel: PokemonDetail.Detail.ViewModel.HeaderView)
}

class PokemonDetailViewController: BaseViewController<PokemonDetailView> {
    var interactor: PokemonDetailBusinessLogic?
    var router: (NSObjectProtocol & PokemonDetailRoutingLogic & PokemonDetailDataPassing)?

    private typealias Section = AnimatableSectionModel<String, PokemonDetail.TableItem>
    private var tableItems = BehaviorSubject<[Section]>(value: [])
    private let headerView = AccountSetupAccountOrderHeaderView()

    // MARK: Setup

    override func setup() {
        let viewController = self
        let interactor = PokemonDetailInteractor()
        let presenter = PokemonDetailPresenter()
        let router = PokemonDetailRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBaseNavigationBar()
        setupHeaderView()
        fetchData()
    }

    override func bindUI() {
        super.bindUI()
        _view.tableView.rx.setDelegate(self).disposed(by: disposeBag)

        let animation = AnimationConfiguration(insertAnimation: .top, reloadAnimation: .top, deleteAnimation: .bottom)
        let datasource = RxTableViewSectionedAnimatedDataSource<Section>(animationConfiguration: animation,
                                                                         configureCell: { [weak self] _, tableView, indexPath, item in
                                                                            guard let self = self else { return UITableViewCell() }
                                                                            return self.setupCell(tableView: tableView, indexPath: indexPath, item: item)
                                                                         })

        tableItems
            .asObserver()
            .bind(to: _view.tableView.rx.items(dataSource: datasource))
            .disposed(by: disposeBag)
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        headerView.setupColorsAndStyles()
    }

    // MARK: Do something

    func fetchData() {
        let request = PokemonDetail.Detail.Request()
        interactor?.fetchData(request: request)
    }

    private func setupHeaderView() {
        _view.tableView.tableHeaderView = headerView
        headerView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            headerView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            headerView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }

    private func setupCell(tableView: UITableView, indexPath: IndexPath, item: PokemonDetail.TableItem) -> UITableViewCell {
        let cell = tableView.forceDequeueReusableCell(indexPath, type: NameValueTableViewCell.self)
        switch item {
        case .ability(let name):
            cell.setupCell(with: name, description: "")
            return cell
        case .stats(let name, let value):
            cell.setupCell(with: name, description: value)
            return cell
        }
    }
}

extension PokemonDetailViewController: PokemonDetailDisplayLogic {

    func displayPokemonDetail(viewModel: PokemonDetail.Detail.ViewModel) {
        let sections = viewModel.pokemonDetail.map { Section(model: $0.section.title, items: $0.items)}
        tableItems.onNext(sections)
    }

    func displayHeaderView(viewModel: PokemonDetail.Detail.ViewModel.HeaderView) {
        headerView.imageUrl = viewModel.imageUrl
    }
}

// MARK: - UITableViewDelegate
extension PokemonDetailViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let tableItems = try? tableItems.value(),
            tableItems.count > section,
            !(tableItems[section].model == ""),
            !tableItems[section].items.isEmpty else {
                return nil
        }

        let result = SectionView()
        result.titleText = tableItems[section].model
        return result
    }
}
