//
//  SectionView.swift
//  SPokemon
//
//  Created by José Moreira on 21/12/2020.
//

import UIKit
import AppTheme
import Common

class SectionView: BaseView {

    @UseAutoLayout
    private var titleLabel = configure(UILabel()) {
        $0.numberOfLines = 1
    }

    public var titleText: String = "" {
        didSet {
            titleLabel.text = titleText
        }
    }

    override func addSubviews() {
        super.addSubviews()
        addSubview(titleLabel)
    }

    override func setupAutoLayout() {
        super.setupAutoLayout()
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constants.AutoLayout.baseMargin),
            titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Constants.AutoLayout.baseMargin),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.AutoLayout.baseMargin),
            bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.AutoLayout.baseMargin)
        ])
    }

    override func setupColorsAndStyles() {
        super.setupColorsAndStyles()
        backgroundColor = ColorName.surface.uiColor
        StylesApplicator.shared.applyStyle(LabelStyleType.title, toLabel: titleLabel)
    }
}
