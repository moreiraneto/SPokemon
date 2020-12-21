//
//  IntroView.swift
//  SPokemon
//
//  Created by José Moreira on 20/12/2020.
//

import UIKit
import Common
import AppTheme

class PokemonListView: BaseView {

    @UseAutoLayout
    var tableView = configure(UITableView()) {
        $0.configure()
    }

    override func addSubviews() {
        super.addSubviews()
        addSubview(tableView)
    }

    override func setupAutoLayout() {
        super.setupAutoLayout()
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    override func setupColorsAndStyles() {
        super.setupColorsAndStyles()
        tableView.backgroundColor = ColorName.background.uiColor
    }
}
