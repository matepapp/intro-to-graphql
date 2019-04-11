//
//  ViewController.swift
//  nsbudapest-graphql
//
//  Created by Mate Papp on 2019. 03. 31..
//  Copyright © 2019. Mate Papp. All rights reserved.
//

import UIKit
import Apollo
import Emoji
import SkeletonView

final class ProfileViewController: UIViewController {
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var statusLabel: UILabel!
    @IBOutlet private weak var bioLabel: UILabel!
    @IBOutlet private weak var companyLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var totalRepositories: UILabel!

    private let apollo = Apollo()

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchProfileData()
    }

    private func fetchProfileData() {
        view.showAnimatedSkeleton()

        apollo.client.fetch(
            query: ProfileQuery(),
            cachePolicy: CachePolicy.returnCacheDataAndFetch
        ) { [weak self] (result, error) in
            guard error == nil, let viewer = result?.data?.viewer else { return }
            self?.view.hideSkeleton()
            self?.updateLabels(with: viewer)
        }
    }

    private func changeStatus(emoji: String, message: String) {
        statusLabel.showSkeleton()

        let input = ChangeUserStatusInput(emoji: emoji, message: message)
        apollo.client.perform(mutation: ChangeUserStatusMutation(input: input)) { [weak self] (result, error) in
            guard error == nil, let status = result?.data?.changeUserStatus?.status else { return }
            self?.statusLabel.text = status.fragments.statusFragment.statusLabel
            self?.statusLabel.hideSkeleton()
        }
    }

    private func updateLabels(with viewer: ProfileQuery.Data.Viewer) {
        title = viewer.login
        avatarImageView.rounded.downloaded(from: viewer.avatarUrl, contentMode: .scaleAspectFill)
        nameLabel.text = viewer.name
        statusLabel.text = viewer.status?.fragments.statusFragment.statusLabel
        companyLabel.text = viewer.company
        emailLabel.text = viewer.email
        locationLabel.text = viewer.location
        totalRepositories.text = "\(viewer.repositories.totalCount) repositories"
    }

    @IBAction private func editButtonTapped(_ sender: Any) {
        let alertController = UIAlertController(title: "Change status", message: "", preferredStyle: .alert)

        alertController.addTextField { textField in
            textField.placeholder = "Emoji"
        }

        alertController.addTextField { textField in
            textField.placeholder = "Message"
        }

        let confirmAction = UIAlertAction(title: "Submit", style: .default) { [weak self] _ in
            guard
                let textFields = alertController.textFields,
                let emojiText = textFields[0].text,
                let messageText = textFields[1].text
                else { return }
            self?.changeStatus(emoji: emojiText.emojiEscapedString, message: messageText)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
}

extension StatusFragment {
    var statusLabel: String? {
        guard let statusEmoji = emoji, let statusMessage = message else { return nil}

        return "\(statusEmoji.emojiUnescapedString) - \(statusMessage)"
    }
}

