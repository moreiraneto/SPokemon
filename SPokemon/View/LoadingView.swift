//
//  LoadingView.swift
//  SPokemon
//
//  Created by José Moreira on 21/12/2020.
//

import UIKit
import AppTheme
import Common

class LoadingView: BaseView {

    @UseAutoLayout
    private var activeIndicator = UIActivityIndicatorView()

    override func setupSubviews() {
        super.setupSubviews()
    }

    override func addSubviews() {
        super.addSubviews()
        addSubview(activeIndicator)
    }

    override func setupAutoLayout() {
        super.setupAutoLayout()
        NSLayoutConstraint.activate([
//            activeIndicator.heightAnchor.constraint(equalToConstant: 100),
//            activeIndicator.widthAnchor.constraint(equalToConstant: 100),
            activeIndicator.centerYAnchor.constraint(equalTo: centerYAnchor),
            activeIndicator.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

    override func setupColorsAndStyles() {
        super.setupColorsAndStyles()
        backgroundColor = ColorName.background.uiColor
        activeIndicator.color = ColorName.primary.uiColor
    }

    func startAnimating() {
        activeIndicator.startAnimating()
    }
}
