// FriendsCell.swift
// Copyright © Polina. All rights reserved.

import UIKit

final class FriendsCell: UITableViewCell {
    // MARK: - IBOutlets

    @IBOutlet private var friendImageView: UIImageView!
    @IBOutlet private var nameLabel: UILabel!

    // MARK: - Private Methods

    public func fill(with friend: User) {
        nameLabel.text = friend.name
        guard let image = UIImage(named: friend.image) else { return }
        friendImageView.image = image
    }
}
