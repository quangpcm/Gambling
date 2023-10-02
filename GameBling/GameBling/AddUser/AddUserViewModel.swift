//
//  AddUserViewModel.swift
//  GameBling
//
//  Created by Dong Duong V. on 11/09/2023.
//

import Foundation
import UIKit

final class AddUserViewModel {

    var inforUsers: [InforPlayer] = []
}

extension AddUserViewModel {

    func numberOfItem() -> Int {
        inforUsers.count
    }

    func viewModelForUser(at indexPath: IndexPath) -> UserCellViewModel? {
        guard indexPath.item < inforUsers.count else { return nil  }
        let item = inforUsers[indexPath.item]
            return UserCellViewModel(image: item.image, name: item.name, gender: "")
        }
    }

struct InforPlayer {
    var name: String
    var image: UIImage
    var gender: Gender
}
