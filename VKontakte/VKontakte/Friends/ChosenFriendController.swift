// ChosenFriendController.swift
// Copyright © Polina. All rights reserved.

import UIKit

final class ChosenFriendController: UICollectionViewController {
    // MARK: - Private Properties

    private var friendCellID = "FriendProfileCell"

    // MARK: - Public Properties

    public var userAvatar: User?

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }

    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: friendCellID, for: indexPath) as? FriendProfileCell
        else { return UICollectionViewCell() }

        guard let avatar = userAvatar else { fatalError() }
        cell.fill(with: avatar)

        return cell
    }
}
