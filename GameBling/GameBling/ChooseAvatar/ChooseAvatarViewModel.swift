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
    var dataUsers: [UserInfor] =
    [
        UserInfor(id: 1, image: UIImage(named: "image1"), gender: Gender.male),
        UserInfor(id: 2, image: UIImage(named: "image2"), gender: Gender.felmale),
        UserInfor(id: 3, image: UIImage(named: "image3"), gender: Gender.male),
        UserInfor(id: 4, image: UIImage(named: "image4"), gender: Gender.felmale),
        UserInfor(id: 5, image: UIImage(named: "image5"), gender: Gender.male),
        UserInfor(id: 6, image: UIImage(named: "image6"), gender:  Gender.male)
    ]

    func numberOfItemInSection() -> Int {
        dataUsers.count
    }

    func viewModelForChooseAvatar(at indexPath: IndexPath) -> AvatarCellViewModel {
        let datas = dataUsers[indexPath.item]
        return AvatarCellViewModel(image: datas.image)
    }

    func setSelectedUser(_ indexPath: IndexPath) {
        selectedUserInfo = dataUsers[indexPath.item]
    }
}

struct UserInfor {
    var id: Int
    var image: UIImage?
    var gender: Gender
}
