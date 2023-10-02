//
//  UserCell.swift
//  GameBling
//
//  Created by Dong Duong V. on 11/09/2023.
//

import UIKit

final class UserCell: UICollectionViewCell {

    // MARK: PROPERTIES
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var userNameLabel: UILabel!
    @IBOutlet private weak var userImageVIew: UIImageView!

    var viewModel: UserCellViewModel? {
        didSet {
            updateUser()
        }
    }

    // MARK: lifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }

    // MARK: Private Function
    private func configureUI() {
        userImageVIew.layer.cornerRadius = userImageVIew.frame.size.width / 5
        userImageVIew.layer.borderWidth = 2
        userImageVIew.layer.borderColor =  UIColor.black.cgColor
    }

    private func updateUser() {
        userImageVIew.image = viewModel?.image
        userNameLabel.text = viewModel?.name
    }
}
