//
//  String+Extension.swift
//  SPokemon
//
//  Created by José Moreira on 21/12/2020.
//

import Foundation

extension String {
    func getoffset() -> Int? {
        if let urlComponents = URLComponents(string: self),
           let offsetString = urlComponents.queryItems?.first(where: { $0.name == "offset" })?.value,
           let newOffset = Int(offsetString) {
            return newOffset
        }
        return nil
    }
}
