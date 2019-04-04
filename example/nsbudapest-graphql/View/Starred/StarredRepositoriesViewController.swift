//
//  StarredViewController.swift
//  nsbudapest-graphql
//
//  Created by Mate Papp on 2019. 04. 02..
//  Copyright © 2019. Mate Papp. All rights reserved.
//

import UIKit
import Apollo

final class StarredRepositoriesViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!

    private var contributedRepositories: [RepositoryCellFragment] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    private var starredRepositories: [RepositoryCellFragment] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    private var sections: [Int: [RepositoryCellFragment]] {
        return [
            0: contributedRepositories,
            1: starredRepositories
        ]
    }

    private var watcher: GraphQLQueryWatcher<StarredRepositoriesQuery>!
    private let repositoriesCount = 10

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        fetchData()
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(
            StarredRepositoryTableViewCell.nib,
            forCellReuseIdentifier: StarredRepositoryTableViewCell.reuseIdentifier
        )
        tableView.estimatedRowHeight = 72.0
        tableView.rowHeight = UITableView.automaticDimension
    }

    private func fetchData() {
        watcher = Apollo.client.watch(
            query: StarredRepositoriesQuery(numberOfLastStarred: repositoriesCount)
        ) { [unowned self] (result, error) in
                guard error == nil, let viewer = result?.data?.viewer else { return }
                self.view.hideSkeleton()

                guard let contributed = viewer.repositoriesContributedTo.nodes else { return }
                self.contributedRepositories = contributed.compactMap { $0?.fragments.repositoryCellFragment }

                guard let starred = viewer.starredRepositories.nodes else { return }
                self.starredRepositories = starred.compactMap { $0?.fragments.repositoryCellFragment }
            }
    }
}

extension StarredRepositoriesViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section]?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: StarredRepositoryTableViewCell.reuseIdentifier,
            for: indexPath
        ) as? StarredRepositoryTableViewCell else {
            return UITableViewCell()
        }

        if let fragment = sections[indexPath.section]?[indexPath.row] {
            cell.configure(fragment: fragment)
        }

        return cell
    }
}

extension StarredRepositoriesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Repositories you contributed" : "Starred Repositories"
    }
}
