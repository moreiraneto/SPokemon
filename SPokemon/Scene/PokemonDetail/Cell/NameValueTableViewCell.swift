//
//  NameValueTableViewCell.swift
//  SPokemon
//
//  Created by José Moreira on 21/12/2020.
//

import UIKit
import Common
import AppTheme

public class NameValueTableViewCell: TableCell {

    @UseAutoLayout
    private var stackView = configure(UIStackView()) {
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.axis = .horizontal
        $0.spacing = 8
    }

    private var titleLabel = configure(UILabel()) {
        $0.textAlignment = .left
        $0.numberOfLines = 0
    }

    private var descriptionLabel = configure(UILabel()) {
        $0.textAlignment = .right
        $0.numberOfLines = 0
    }

    public override func addSubviews() {
        super.addSubviews()
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)
    }

    public override func setupAutoLayout() {
        super.setupAutoLayout()
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.AutoLayout.baseMargin),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.AutoLayout.baseMargin),
            contentView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: Constants.AutoLayout.baseMargin),
            contentView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: Constants.AutoLayout.baseMargin)
        ])
    }

    override public func setupColorsAndStyles() {
        super.setupColorsAndStyles()
        StylesApplicator.shared.applyStyle(LabelStyleType.bodyRegular, toLabel: titleLabel)
        StylesApplicator.shared.applyStyle(LabelStyleType.bodyRegularOnSurface2, toLabel: descriptionLabel)
        backgroundColor = .clear
    }

    public func setupCell(with title: String, description: String) {
        titleLabel.text = title
        descriptionLabel.text = description
    }
}
