//
//  ChooseAvatarViewModel.swift
//  GameBling
//
//  Created by Dong Duong V. on 11/09/2023.
//

import Foundation
import UIKit

final class ChooseAvatarViewModel {

    private var model: Model = Model()
     var selectedUserInfo: UserInfor?
   
    func numberOfItemInSection() -> Int {
        model.dataUsers.count 
    }

    func viewModelForChooseAvatar(at indexPath: IndexPath) -> AvatarCellViewModel {
        let datas = model.dataUsers[indexPath.item]
        return AvatarCellViewModel(image: datas.image)
    }

    func setSelectedUser(_ indexPath: IndexPath) {
        selectedUserInfo = model.dataUsers[indexPath.item]
    }
}
