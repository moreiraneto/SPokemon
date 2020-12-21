//
//  BaseView.swift
//  SPokemon
//
//  Created by José Moreira on 20/12/2020.
//

import UIKit
import AppTheme

open class BaseView: UIView {

    required public init() {
        super.init(frame: CGRect.zero)

        setupSubviews()
        addSubviews()
        setupAutoLayout()
        setupColorsAndStyles()
        bindUI()
    }

    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError("You should not be using Interface builder ;)")
    }

    open func setupSubviews() {}

    open func addSubviews() {}

    open func setupAutoLayout() {}

    open func bindUI() {}

    open func setupColorsAndStyles() {
        backgroundColor = ColorName.background.uiColor
    }
}
