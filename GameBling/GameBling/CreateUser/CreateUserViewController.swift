//
//  CreateUserViewController.swift
//  GameBling
//
//  Created by Dong Duong V. on 11/09/2023.
//

import UIKit

protocol CreateUserViewControllerDelegate: AnyObject {
    func controller(controller: CreateUserViewController, action: CreateUserViewController.Action)
}

class CreateUserViewController: UIViewController  {

    var imageUsers: UIImage!
    var gender: String = ""

    enum Action {
        case inforUser(name: String, image: UIImage, gender: String)
    }
    
    weak var delegate: CreateUserViewControllerDelegate?

    @IBOutlet private weak var imageUser: UIImageView!
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var containerContentView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var submitButton: UIButton!

    var imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        containerContentView.layer.borderColor = UIColor.black.cgColor
        containerContentView.layer.borderWidth = 1
        containerContentView.layer.cornerRadius = 12
    }

    func textFieldDidChangeSelection(_ textField: UITextField) {
        if nameTextField.text != ""  {
            submitButton.isEnabled = true
        } else {
            submitButton.isEnabled = false
        }
    }

    //MARK: IBAction
    @IBAction func chooseImageButtonTouchUpInside(_ sender: Any) {
        let chooseAvatar = ChooseAvatarViewController()
        chooseAvatar.delegate = self
        navigationController?.pushViewController(chooseAvatar, animated: true)
    }

    @IBAction func submitButtonTouchUpInside(_ sender: Any) {
        var name = nameTextField.text ?? ""
        if !name.isEmpty {
            submitButton.isEnabled = true
            delegate?.controller(controller: self, action: .inforUser(name: nameTextField.text ?? "", image: imageUsers, gender: gender))
            navigationController?.popViewController(animated: true)
        }
    }
}

extension CreateUserViewController: ChooseAvatarViewControllerDelegate {
    func controller(_ controller: ChooseAvatarViewController, action: ChooseAvatarViewController.Action) {
        switch action {
        case let .chooseImage(image, sex):
            imageUser.image = image
            imageUsers = image
            gender = sex
        }
    }
}
