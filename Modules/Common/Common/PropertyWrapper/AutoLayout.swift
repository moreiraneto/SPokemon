//
//  AutoLayout.swift
//  Common
//
//  Created by José Moreira on 20/12/2020.
//  Copyright © 2020 Bliss Applications. All rights reserved.
//

import UIKit

@propertyWrapper
public struct UseAutoLayout<T> {
    public var wrappedValue: T {
        didSet {
            setAutoLayout()
        }
    }

    public init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
        setAutoLayout()
    }

    func setAutoLayout() {
        (wrappedValue as? UIView)?.translatesAutoresizingMaskIntoConstraints = false
    }
}
