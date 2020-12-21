//
//  UITableView+Extension.swift
//  Common
//
//  Created by José Moreira on 20/12/2020.
//  Copyright © 2020 Bliss Applications. All rights reserved.
//

import UIKit

public extension UITableView {
    func configure(separatorStyle: UITableViewCell.SeparatorStyle = .none) {
        self.separatorStyle = separatorStyle
        tableFooterView = UIView()
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        rowHeight = UITableView.automaticDimension
    }

    func forceDequeueReusableCell<T: UITableViewCell>(_ indexPath: IndexPath, type: T.Type) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.identifier)")
        }
        return cell
    }
}
