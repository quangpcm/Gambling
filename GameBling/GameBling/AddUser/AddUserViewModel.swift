//
//  AddUserViewModel.swift
//  GameBling
//
//  Created by Dong Duong V. on 11/09/2023.
//

import Foundation
import UIKit

final class AddUserViewModel {

    var datas: [InforPlayer] = []

    func numberOfItem() -> Int {
        datas.count
    }

    func viewModelForUser(at indexPath: IndexPath) -> UserCellViewModel {
        let item = datas[indexPath.item]
        return UserCellViewModel(image: item.image, name: item.name, gender: "")
    }
}
struct InforPlayer {
    var name: String
    var image: UIImage
    var gender: String
}

