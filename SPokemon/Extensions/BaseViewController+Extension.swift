//
//  BaseViewController+Extension.swift
//  SPokemon
//
//  Created by José Moreira on 20/12/2020.
//

import UIKit
import AppTheme

extension BaseViewController {
    public func setupBaseNavigationBar(color: ColorName = ColorName.background) {
        navigationController?.navigationBar.tintColor = ColorName.primary.uiColor
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = color.uiColor
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UINavigationBar().shadowImage
    }
}
