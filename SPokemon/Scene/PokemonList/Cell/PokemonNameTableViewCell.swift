//
//  PokemonNameTableViewCell.swift
//  SPokemon
//
//  Created by José Moreira on 20/12/2020.
//

import UIKit
import Common
import AppTheme

public class PokemonNameTableViewCell: TableCell {

    @UseAutoLayout
    private var titleLabel = configure(UILabel()) {
        $0.textAlignment = .left
        $0.numberOfLines = 0
    }

    @UseAutoLayout
    private var pokemonImageView = configure(UIImageView()) {
        $0.contentMode = .scaleAspectFit
    }

    public override func addSubviews() {
        super.addSubviews()
        contentView.addSubview(titleLabel)
        contentView.addSubview(pokemonImageView)
    }

    public override func setupAutoLayout() {
        super.setupAutoLayout()
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.AutoLayout.baseMargin),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.AutoLayout.baseMargin),
            titleLabel.trailingAnchor.constraint(equalTo: pokemonImageView.trailingAnchor, constant: Constants.AutoLayout.baseMargin),
            contentView.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.AutoLayout.baseMargin),
            pokemonImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            pokemonImageView.widthAnchor.constraint(equalToConstant: Constants.AutoLayout.pokemonListImageSize),
            pokemonImageView.heightAnchor.constraint(equalToConstant: Constants.AutoLayout.pokemonListImageSize),
            contentView.trailingAnchor.constraint(equalTo: pokemonImageView.trailingAnchor, constant: Constants.AutoLayout.baseMargin)
        ])
    }

    override public func setupColorsAndStyles() {
        super.setupColorsAndStyles()
        StylesApplicator.shared.applyStyle(LabelStyleType.title, toLabel: titleLabel)
        backgroundColor = .clear
    }

    public func setupCell(with name: String, imageUrl: String) {
        titleLabel.text = name
        pokemonImageView.image(with: imageUrl)
    }
}
