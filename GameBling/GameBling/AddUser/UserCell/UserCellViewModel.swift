//
//  UserCellViewModel.swift
//  GameBling
//
//  Created by Dong Duong V. on 11/09/2023.
//

import Foundation
import UIKit

final class UserCellViewModel {
    
    var image: UIImage?
    var name: String
    var gender: String
    
    init(image: UIImage, name: String, gender: String) {
        self.image = image
        self.name = name
        self.gender = gender
    }
}
