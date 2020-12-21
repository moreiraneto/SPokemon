//
//  PaginatedParameter.swift
//  Data
//
//  Created by José Moreira on 20/12/2020.
//  Copyright © 2020 Bliss Applications. All rights reserved.
//

import Foundation

public struct PaginatedParameter: Codable {
    let limit: Int
    let offset: Int

    public init(limit: Int, offset: Int) {
        self.limit = limit
        self.offset = offset
    }
}

