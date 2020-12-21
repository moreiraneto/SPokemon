//
//  UIScrollVIew+Extension.swift
//  Common
//
//  Created by José Moreira on 21/12/2020.
//  Copyright © 2020 Bliss Applications. All rights reserved.
//

import UIKit

public extension UIScrollView {
    func isScrollAlmostReachingBottom() -> Bool {
        let startLoadingOffset: CGFloat = 80.0
        return contentOffset.y + frame.size.height + startLoadingOffset > contentSize.height
    }
}
