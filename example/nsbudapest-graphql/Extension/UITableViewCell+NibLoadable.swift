//
//  UITableViewCell+NibLoadable.swift
//  nsbudapest-graphql
//
//  Created by Mate Papp on 2019. 04. 04..
//  Copyright © 2019. Mate Papp. All rights reserved.
//
import UIKit

protocol NibLoadable: class {
    static var nibName: String { get }
    static var nib: UINib { get }
}

extension NibLoadable where Self: UITableViewCell {
    static var nibName: String {
        return String(describing: self)
    }

    static var nib: UINib {
        return UINib(nibName: nibName, bundle: Bundle(for: self))
    }
}
