// ChosenFriendController.swift
// Copyright © Polina. All rights reserved.

import UIKit

final class ChosenFriendController: UICollectionViewController {
    // MARK: - Private Properties

    private var friendCellID = "FriendProfileCell"

    // MARK: - Public Properties

    var imageName = String()

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }

//
//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        1
//    }

    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: "FriendProfileCell", for: indexPath) as? FriendProfileCell
        else { return UICollectionViewCell() }

        cell.friendPhotoImageView.image = UIImage(named: imageName)

        return cell
    }
}
