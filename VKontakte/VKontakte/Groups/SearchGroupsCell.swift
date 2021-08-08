// SearchGroupsCell.swift
// Copyright © Polina. All rights reserved.

import UIKit

final class SearchGroupsCell: UITableViewCell {
    // MARK: - IBOutlets

    @IBOutlet private var searchGropusImageView: UIImageView!
    @IBOutlet private var searchGroupsLabel: UILabel!

    // MARK: - Public Methods

    public func fill(with group: Group) {
        searchGroupsLabel.text = group.name
        guard let image = UIImage(named: group.image) else { return }
        searchGropusImageView.image = image
    }
}
