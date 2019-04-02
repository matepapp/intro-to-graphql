//
//  ViewController.swift
//  nsbudapest-graphql
//
//  Created by Mate Papp on 2019. 03. 31..
//  Copyright © 2019. Mate Papp. All rights reserved.
//

import UIKit
import Emoji
import SkeletonView

class ProfileViewController: UIViewController {
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var statusLabel: UILabel!
    @IBOutlet private weak var bioLabel: UILabel!
    @IBOutlet private weak var companyLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var totalRepositories: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.showAnimatedSkeleton()

        Apollo.client.fetch(query: ProfileQuery()) { [unowned self] (result, error) in
            guard error == nil, let viewer = result?.data?.viewer else { return }
            self.view.hideSkeleton()
            self.updateLabels(with: viewer)
        }
    }

    private func updateLabels(with viewer: ProfileQuery.Data.Viewer) {
        title = viewer.login
        avatarImageView.rounded.downloaded(from: viewer.avatarUrl, contentMode: .scaleAspectFill)
        nameLabel.text = viewer.name
        statusLabel.text = constructStatusLabelText(from: viewer.status)
        bioLabel.text = viewer.bio
        companyLabel.text = viewer.company
        emailLabel.text = viewer.email
        locationLabel.text = viewer.location
        totalRepositories.text = "\(viewer.repositories.totalCount) repositories"
    }
}

extension ProfileViewController {
    private func constructStatusLabelText(from status: ProfileQuery.Data.Viewer.Status?) -> String? {
        guard let statusEmoji = status?.emoji, let statusMessage = status?.message else {
            return nil
        }

        return "\(statusEmoji.emojiUnescapedString) - \(statusMessage)"
    }
}

