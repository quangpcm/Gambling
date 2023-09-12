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
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var imageUser: UIImageView!

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
        imageUser.layer.cornerRadius = imageUser.frame.size.width / 5
        imageUser.layer.borderWidth = 2
        imageUser.layer.borderColor =  UIColor.black.cgColor
    }

    private func updateUser() {
        imageUser.image = viewModel?.image
        nameLabel.text = viewModel?.name
    }
}
