// FriendsController.swift
// Copyright © Polina. All rights reserved.

import UIKit

final class FriendsController: UITableViewController {
    // MARK: - Public Properties

    public var friends: [User] = [
        User(name: "Aang", image: "aang"),
        User(name: "Batman", image: "bats"),
        User(name: "Hipster", image: "dudeinscarf"),
        User(name: "General", image: "general"),
        User(name: "Homer", image: "homer"),
        User(name: "Neytiri", image: "lol"),
        User(name: "Tengu", image: "tengu")
    ]

    // MARK: - Private Properties

    private let friendsCellID = "FriendsCell"

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        friends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: friendsCellID, for: indexPath) as? FriendsCell
        else { return UITableViewCell() }

        cell.fill(with: friends[indexPath.row])

        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "FriendCollectionSegue",
              let vc = segue.destination as? ChosenFriendController,
              let selectedRow = tableView.indexPathForSelectedRow?.row else { return }
        vc.userAvatar = friends[selectedRow]
    }
}
