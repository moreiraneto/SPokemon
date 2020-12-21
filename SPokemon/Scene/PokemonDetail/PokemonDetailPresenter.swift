//
//  PokemonDetailPresenter.swift
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

protocol PokemonDetailPresentationLogic: BasePresenter {
    func presentPokemonDetail(response: PokemonDetail.Detail.Response)
}

class PokemonDetailPresenter: BasePresenter, PokemonDetailPresentationLogic {
    weak var viewController: PokemonDetailDisplayLogic?

    override func baseViewController() -> BaseDisplayLogic? { return viewController }

    // MARK: Do something

    func presentPokemonDetail(response: PokemonDetail.Detail.Response) {
        let imageUrl = response.pokemonDetail.sprites.other.officialArtwork.frontDefault ?? response.pokemonDetail.sprites.frontDefault
        presentHeaderView(with: imageUrl)

        var sectionItems = [PokemonDetail.TableSection]()

        let abilitySection = PokemonDetail.SectionItem.abilities(title: "Abilities")
        let abilityItems = response.pokemonDetail.abilities.map { PokemonDetail.TableItem.ability(name: $0.ability.name) }

        sectionItems.append(PokemonDetail.TableSection(section: abilitySection, items: abilityItems))

        let statsSection = PokemonDetail.SectionItem.stats(title: "Stats")
        let statsItems = response.pokemonDetail.stats.map { PokemonDetail.TableItem.stats(name: $0.stat.name,
                                                                                          value: "\($0.baseStat)") }

        sectionItems.append(PokemonDetail.TableSection(section: statsSection, items: statsItems))

        let viewModel = PokemonDetail.Detail.ViewModel(pokemonDetail: sectionItems)
        viewController?.displayPokemonDetail(viewModel: viewModel)
    }

    private func presentHeaderView(with imageUrl: String) {
        let viewModel = PokemonDetail.Detail.ViewModel.HeaderView(imageUrl: imageUrl)
        viewController?.displayHeaderView(viewModel: viewModel)
    }
}