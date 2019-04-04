//
//  StarredRepositoryTableViewCell.swift
//  nsbudapest-graphql
//
//  Created by Mate Papp on 2019. 04. 04..
//  Copyright © 2019. Mate Papp. All rights reserved.
//

import UIKit

class StarredRepositoryTableViewCell: UITableViewCell, Reusable, NibLoadable {
    @IBOutlet private weak var starButton: UIButton!
    @IBOutlet private weak var starCountLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    private func setup() {
    }

    func configure(fragment: RepositoryCellFragment) {
        textLabel?.text = fragment.name
        let image = fragment.viewerHasStarred ? UIImage(named: "star-filled") : UIImage(named: "star")
        starButton.setImage(image, for: .normal)
        starCountLabel.text = "\(fragment.stargazers.totalCount)"
    }
}
