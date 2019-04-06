//
//  StarredRepositoryTableViewCell.swift
//  nsbudapest-graphql
//
//  Created by Mate Papp on 2019. 04. 04..
//  Copyright © 2019. Mate Papp. All rights reserved.
//

import UIKit
import Apollo
import UIColor_Hex_Swift

class StarredRepositoryTableViewCell: UITableViewCell, Reusable, NibLoadable {
    @IBOutlet private weak var languageView: UIView!
    @IBOutlet private weak var repositoryLabel: UILabel!
    @IBOutlet private weak var authorLabel: UILabel!
    @IBOutlet private weak var languageLabel: UILabel!
    @IBOutlet private weak var starCountLabel: UILabel!
    @IBOutlet private weak var starButton: UIButton!

    private var isStarred = false {
        didSet {
            if isStarred {
                starButton.setImage(UIImage(named: "star-filled"), for: .normal)
            } else {
                starButton.setImage(UIImage(named: "star"), for: .normal)
            }
        }
    }
    
    func configure(fragment: RepositoryCellFragment) {
        languageView.backgroundColor = UIColor(fragment.primaryLanguage?.color ?? "EEE")
        repositoryLabel.text = fragment.name
        authorLabel.text = fragment.owner.login
        languageLabel.text = fragment.primaryLanguage?.name
        starCountLabel.text = "\(fragment.stargazers.totalCount)"
        isStarred = fragment.viewerHasStarred
    }
}
