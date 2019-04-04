//
//  StarredRepositoryTableViewCell.swift
//  nsbudapest-graphql
//
//  Created by Mate Papp on 2019. 04. 04..
//  Copyright © 2019. Mate Papp. All rights reserved.
//

import UIKit
import Apollo

class StarredRepositoryTableViewCell: UITableViewCell, Reusable, NibLoadable {
    @IBOutlet private weak var starButton: UIButton!
    @IBOutlet private weak var starCountLabel: UILabel!

    private var isStarred = false {
        didSet {
            if isStarred {
                starButton.setImage(UIImage(named: "star-filled"), for: .normal)
            } else {
                starButton.setImage(UIImage(named: "star"), for: .normal)
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(fragment: RepositoryCellFragment) {
        textLabel?.text = fragment.name
        isStarred = fragment.viewerHasStarred
        starCountLabel.text = "\(fragment.stargazers.totalCount)"
    }
}
