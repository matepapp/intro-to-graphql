//
//  ViewController.swift
//  nsbudapest-graphql
//
//  Created by Mate Papp on 2019. 03. 31..
//  Copyright © 2019. Mate Papp. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var companyLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        Apollo.client.fetch(query: ProfileQuery()) { [unowned self] (result, error) in
            guard error == nil, let viewer = result?.data?.viewer else { return }
            self.updateLabels(with: viewer)
        }
    }

    private func updateLabels(with viewer: ProfileQuery.Data.Viewer) {
        nameLabel.text = viewer.name
        emailLabel.text = viewer.email
        companyLabel.text = viewer.company
        locationLabel.text = viewer.location
        avatarImageView.downloaded(from: viewer.avatarUrl, contentMode: .scaleAspectFill)
    }
}

