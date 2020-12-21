//
//  PokemonDetailHeaderView.swift
//  SPokemon
//
//  Created by José Moreira on 21/12/2020.
//

import UIKit
import AppTheme
import Common

class AccountSetupAccountOrderHeaderView: BaseView {

    @UseAutoLayout
    private var imageView = configure(UIImageView()) {
        $0.contentMode = .scaleAspectFit
    }

    public var imageUrl: String = "" {
        didSet {
            imageView.image(with: imageUrl)
        }
    }

    private var customConstraints = [NSLayoutConstraint]()

    override func addSubviews() {
        super.addSubviews()
        addSubview(imageView)
    }

    override func setupAutoLayout() {
        super.setupAutoLayout()

        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])

    }

    override func setupColorsAndStyles() {
        super.setupColorsAndStyles()
        backgroundColor = ColorName.background.uiColor
    }
}
