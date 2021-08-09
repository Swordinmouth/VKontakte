// CustomControl.swift
// Copyright © Polina. All rights reserved.

import UIKit

@IBDesignable final class CustomControl: UIControl {
    // MARK: - Private Properties

    private var stackView = UIStackView()

    private var likeCounter = 0 {
        didSet {
            updateLikeLabel()
        }
    }

    private var likeLabel: UILabel!
    private var likeButton: UIButton!

    // MARK: - Private Methods

    private func createLikeLabel() {
        likeLabel = UILabel()
        likeLabel.text = "0"
    }

    private func createLikeButton() {
        likeButton = UIButton()
        likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        likeButton.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        likeButton.tintColor = .gray
        likeButton.addTarget(self, action: #selector(changeCounter(button:)), for: .touchUpInside)
    }

    private func setupView() {
        createLikeLabel()
        createLikeButton()
        stackView = UIStackView(arrangedSubviews: [likeLabel, likeButton])
        stackView.spacing = 5
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        addSubview(stackView)
    }

    // MARK: - Private Methods

    @objc private func changeCounter(button: UIButton) {
        button.isSelected.toggle()
        if button.isSelected {
            likeButton.tintColor = .red
            likeCounter += 1
        } else {
            likeButton.tintColor = .blue
            likeCounter -= 1
        }
    }

    private func updateLikeLabel() {
        likeLabel.text = String(likeCounter)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = bounds
    }
}
