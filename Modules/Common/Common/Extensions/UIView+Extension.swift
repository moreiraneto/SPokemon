//
//  UIView+Extension.swift
//  Common
//
//  Created by José Moreira on 20/12/2020.
//  Copyright © 2020 Bliss Applications. All rights reserved.
//

import UIKit

public extension UIView {
    static var identifier: String {
        String(describing: self)
    }
}
