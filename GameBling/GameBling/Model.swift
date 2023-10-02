//
//  Model.swift
//  GameBling
//
//  Created by Dong Duong V. on 22/09/2023.
//

import Foundation
import UIKit

final class Model {

    var dataUsers: [UserInfor] =
    [
        UserInfor(id: 1, image: UIImage(named: "image1"), gender: Gender.male),
        UserInfor(id: 2, image: UIImage(named: "image2"), gender: Gender.felmale),
        UserInfor(id: 3, image: UIImage(named: "image3"), gender: Gender.male),
        UserInfor(id: 4, image: UIImage(named: "image4"), gender: Gender.felmale),
        UserInfor(id: 5, image: UIImage(named: "image5"), gender: Gender.male),
        UserInfor(id: 6, image: UIImage(named: "image6"), gender:  Gender.male)
    ]
}

struct UserInfor {
    var id: Int
    var image: UIImage?
    var gender: Gender
}

enum Gender {
    case male
    case felmale
}
