//
//  UIImageView+Extension.swift
//  SPokemon
//
//  Created by José Moreira on 21/12/2020.
//

import UIKit
import Kingfisher

extension UIImageView {

    public typealias CompletionHandler = (_ success: Bool) -> Void

    public func image(with urlString: String?,
                      shouldHideOnError: Bool = false,
                      placeHolderImage: UIImage? = nil,
                      completionHandler: CompletionHandler? = nil) {

        if let imageUrl = urlString, let image = URL(string: imageUrl) {
            kf.setImage(
                with: image,
                placeholder: placeHolderImage,
                options: [
                    .cacheOriginalImage
                ], completionHandler: {
                result in
                switch result {
                case .failure:
                    self.isHidden = shouldHideOnError
                    completionHandler?(false)
                case .success:
                    self.isHidden = false
                    completionHandler?(true)
                }
            })
        } else {
            isHidden = shouldHideOnError
            image = placeHolderImage
        }
    }
}

