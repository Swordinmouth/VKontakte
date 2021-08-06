// SearchGroupsController.swift
// Copyright © Polina. All rights reserved.

import UIKit

final class SearchGroupsController: UITableViewController {
    // MARK: - Private Properties

    private let groupsCellID = "SearchGroupsCell"

    // MARK: - Public Properties

    public var groups: [Group] = [
        Group(name: "Фильмы", image: "movies"),
        Group(name: "Поэзия", image: "poetry"),
        Group(name: "Спорт", image: "sport"),
        Group(name: "Чтение", image: "books")
    ]

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        groups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView
            .dequeueReusableCell(withIdentifier: groupsCellID, for: indexPath) as? SearchGroupsCell
        else { return UITableViewCell() }

        cell.fill(with: groups[indexPath.row])

        return cell
    }
}
