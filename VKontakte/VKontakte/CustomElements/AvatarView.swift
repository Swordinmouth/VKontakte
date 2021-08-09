// AvatarView.swift
// Copyright © Polina. All rights reserved.

import UIKit

@IBDesignable final class AvatarView: UIView {

    // MARK: - Properties

    var imageView = UIImageView() {
        didSet {
            setImageView()
        }
    }

    @IBInspectable var shadowColor: UIColor = .black {
        didSet {
            changeShadowOpacity()
        }
    }

    @IBInspectable var shadowOpacity: Float = 0.5 {
        didSet {
            changeShadowOpacity()
        }
    }

    @IBInspectable var shadowOffset: CGSize = .zero {
        didSet {
            changeShadowOffset()
        }
    }

    @IBInspectable var shadowRadius: CGFloat = 10 {
        didSet {
            changeShadowRadius()
        }
    }

    // MARK: - Private Methods

    private func chageShadowColor() {
        layer.shadowColor = shadowColor.cgColor
    }

    private func changeShadowOpacity() {
        layer.shadowOpacity = shadowOpacity
    }

    private func changeShadowOffset() {
        layer.shadowOffset = shadowOffset
    }

    private func changeShadowRadius() {
        layer.shadowRadius = shadowRadius
    }

    private func setImageView() {
        imageView.frame = bounds
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = bounds.height / 2
        addSubview(imageView)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setImageView()
    }
}
