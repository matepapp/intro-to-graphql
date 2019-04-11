//
//  UIImageView+Rounded.swift
//  nsbudapest-graphql
//
//  Created by Mate Papp on 2019. 04. 02..
//  Copyright © 2019. Mate Papp. All rights reserved.
//

import UIKit

extension UIImageView {
    var rounded: UIImageView {
        layer.masksToBounds = false
        layer.cornerRadius = frame.height / 2
        clipsToBounds = true

        return self
    }
}
