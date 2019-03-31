//
//  ViewController.swift
//  nsbudapest-graphql
//
//  Created by Mate Papp on 2019. 03. 31..
//  Copyright © 2019. Mate Papp. All rights reserved.
//

import UIKit
import Apollo

class ViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        apollo.fetch(query: ViewerQuery()) { [unowned self] (result, error) in
            guard error == nil, let viewer = result?.data?.viewer else { return }
            self.updateLabels(with: viewer)
        }
    }
    private func updateLabels(with viewer: ViewerQuery.Data.Viewer) {
        nameLabel.text = viewer.name
        emailLabel.text = viewer.email
        companyLabel.text = viewer.company
        locationLabel.text = viewer.location
    }
}

