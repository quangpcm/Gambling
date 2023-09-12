//
//  AvatarCell.swift
//  GameBling
//
//  Created by Dong Duong V. on 11/09/2023.
//

import UIKit

final class AvatarCell: UICollectionViewCell {

    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var gender: UILabel!

    var viewModel: AvatarCellViewModel? {
        didSet {
            updateUI()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override var isSelected: Bool {
          didSet {
              containerView.backgroundColor = isSelected ? .gray : .white
          }
      }

    func updateUI() {
        avatarImageView.image = viewModel?.image
    }
}
