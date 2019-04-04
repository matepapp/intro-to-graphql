//
//  UITableViewCell+Reusable.swift
//  nsbudapest-graphql
//
//  Created by Mate Papp on 2019. 04. 04..
//  Copyright © 2019. Mate Papp. All rights reserved.
//

import UIKit

protocol Reusable: class {
    static var reuseIdentifier: String { get }
}

extension Reusable where Self: UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
