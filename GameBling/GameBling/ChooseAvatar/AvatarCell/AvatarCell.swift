//
//  AvatarCell.swift
//  GameBling
//
//  Created by Dong Duong V. on 11/09/2023.
//

import UIKit

final class AvatarCell: UICollectionViewCell {

    //MARK: PROPERTIES
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var avatarImageView: UIImageView!
    
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

    private func updateUI() {
        avatarImageView.image = viewModel?.image
        containerView.layer.cornerRadius = 12
    }
}
