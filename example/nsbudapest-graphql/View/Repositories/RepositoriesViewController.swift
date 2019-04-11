//
//  RepositoriesViewController.swift
//  nsbudapest-graphql
//
//  Created by Mate Papp on 2019. 04. 02..
//  Copyright © 2019. Mate Papp. All rights reserved.
//

import UIKit

final class RepositoriesViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!

    private let apollo = Apollo()
    private let numberOfLastActiveRepositories = 2
    private let numberOfLastStarredRepositories = 10
    private var lastActiveRepositories: [RepositoryCellFragment] = []
    private var lastStarredRepositories: [RepositoryCellFragment] = []
    private var sections: [Int: [RepositoryCellFragment]] {
        return [
            0: lastActiveRepositories,
            1: lastStarredRepositories
        ]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        fetchData()
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(
            RepositoryTableViewCell.nib,
            forCellReuseIdentifier: RepositoryTableViewCell.reuseIdentifier
        )
        tableView.estimatedRowHeight = 72.0
        tableView.rowHeight = UITableView.automaticDimension
    }

    private func fetchData() {
        apollo.client.fetch(query: RepositoriesQuery(
            numberOfLastActive: numberOfLastActiveRepositories,
            numberOfLastStarred: numberOfLastStarredRepositories
        )) { [weak self] (result, error) in
                guard error == nil, let viewer = result?.data?.viewer else { return }

                guard let contributed = viewer.repositories.nodes else { return }
                self?.lastActiveRepositories = contributed.compactMap { $0?.fragments.repositoryCellFragment }

                guard let starred = viewer.starredRepositories.nodes else { return }
                self?.lastStarredRepositories = starred.compactMap { $0?.fragments.repositoryCellFragment }

                self?.tableView.reloadData()
            }
    }
}

extension RepositoriesViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section]?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: RepositoryTableViewCell.reuseIdentifier,
            for: indexPath
        ) as? RepositoryTableViewCell else {
            return UITableViewCell()
        }

        if let fragment = sections[indexPath.section]?[indexPath.row] {
            cell.configure(fragment: fragment)
        }

        return cell
    }
}

extension RepositoriesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Your last \(numberOfLastActiveRepositories) active repositories" : "Starred Repositories"
    }
}
