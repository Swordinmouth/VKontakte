// MyGroupsController.swift
// Copyright © Polina. All rights reserved.

import UIKit

final class MyGroupsController: UITableViewController {
    // MARK: - Private Properties

    private var groups: [Group] = [
        Group(name: "Мультики", image: "cartoons"),
        Group(name: "Игры", image: "games"),
        Group(name: "История", image: "history"),
        Group(name: "Hotroad", image: "hotroad"),
        Group(name: "Музыка", image: "music")
    ]

    private let groupsCellID = "MyGroupsCell"

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - IBActions

    @IBAction func addGroups(segue: UIStoryboardSegue) {
        if segue.identifier == "addGroup" {
            guard let searchGroupsController = segue.source as? SearchGroupsController else { return }
            if let indexPath = searchGroupsController.tableView.indexPathForSelectedRow {
                let group = searchGroupsController.groups[indexPath.row]
                groups.append(group)
                tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        groups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: groupsCellID, for: indexPath) as? MyGroupsCell
        else { return UITableViewCell() }

        let group = groups[indexPath.row]

        cell.groupNameLabel.text = group.name
        cell.groupImageView.image = UIImage(named: group.image)

        return cell
    }

    override func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath
    ) {
        if editingStyle == .delete {
            groups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
