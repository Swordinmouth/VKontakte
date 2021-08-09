// FriendProfileCell.swift
// Copyright © Polina. All rights reserved.

import UIKit

final class FriendProfileCell: UICollectionViewCell {
    // MARK: - IBOutlest

    @IBOutlet private var friendPhotoImageView: UIImageView!
    @IBOutlet private var friendNameLabel: UILabel!
    @IBOutlet private var avatarView: AvatarView!

    // MARK: - Private Methods

    public func fill(with friend: User) {
        guard let image = UIImage(named: friend.image) else { return }
        friendPhotoImageView.image = image
        friendNameLabel.text = friend.name
        avatarView.imageView.image = image
    }
}
