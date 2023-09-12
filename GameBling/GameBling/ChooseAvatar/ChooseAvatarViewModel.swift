//
//  ChooseAvatarViewModel.swift
//  GameBling
//
//  Created by Dong Duong V. on 11/09/2023.
//

import Foundation
import UIKit

final class ChooseAvatarViewModel {

    var selectedUserInfo: UserInfor?
    var dataUser: [UserInfor] = [
        UserInfor(id: 1, image: UIImage(named: "image"), gender: "male"),
        UserInfor(id: 2, image: UIImage(named: "image2"), gender: "female"),
        UserInfor(id: 3, image: UIImage(named: "image3"), gender: "male"),
        UserInfor(id: 4, image: UIImage(named: "image4"), gender: "female"),
        UserInfor(id: 5, image: UIImage(named: "image5"), gender: "male"),
        UserInfor(id: 6, image: UIImage(named: "image"), gender: "male")
    ]

    func numberOfItemInSection() -> Int {
        dataUser.count
    }

    func viewModelForChooseAvatar(at indexPath: IndexPath) -> AvatarCellViewModel {
        let datas = dataUser[indexPath.item]
        return AvatarCellViewModel(image: datas.image)
    }

    func setSelectedUser(_ indexPath: IndexPath) {
        selectedUserInfo = dataUser[indexPath.item]
    }
}


struct UserInfor {
    var id: Int
    var image: UIImage?
    var gender: String
}
