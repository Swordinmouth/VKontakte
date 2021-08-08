// MyGroupsCell.swift
// Copyright © Polina. All rights reserved.

import UIKit

final class MyGroupsCell: UITableViewCell {
    // MARK: - IBOutlets

    @IBOutlet private var groupImageView: UIImageView!
    @IBOutlet private var groupNameLabel: UILabel!

    // MARK: - Public Methods

    public func fill(with group: Group) {
        groupNameLabel.text = group.name
        guard let image = UIImage(named: group.image) else { return }
        groupImageView.image = image
    }
}
