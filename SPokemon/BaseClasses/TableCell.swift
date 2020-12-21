//
//  TableCell.swift
//  SPokemon
//
//  Created by José Moreira on 20/12/2020.
//

import UIKit
import RxSwift
import AppTheme

open class TableCell: UITableViewCell, Stylable {

    public var stylesHandler: StylesHandler = StylesHandler()
    public var disposeBag = DisposeBag()

    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupSubviews()
        addSubviews()
        setupAutoLayout()
        setupColorsAndStyles()
        bindUI()
        selectionStyle = .none
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    open func setupSubviews() {}

    open func addSubviews() {}

    open func setupAutoLayout() {}

    open func setupColorsAndStyles() {
        stylesHandler.stylesToSetAfterSetupColorsAndStyles?()
    }

    open func bindUI() {}

    override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        setupColorsAndStyles()
    }

    open override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
}

