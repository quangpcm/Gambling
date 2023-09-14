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

final class CreateUserViewController: UIViewController, UITextFieldDelegate  {

    enum Action {
        case inforUser(name: String, image: UIImage, gender: Gender)
    }
    
    weak var delegate: CreateUserViewControllerDelegate?
    var viewModel: CreateUserViewModel = CreateUserViewModel()

    // MARK: PROPERTIES
    @IBOutlet private weak var userImageView: UIImageView!
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var containerContentView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var submitButton: UIButton!

    var isTextFieldFilled: Bool = false

    // MARK: LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    private func configureUI() {
        containerContentView.layer.borderColor = UIColor.black.cgColor
        containerContentView.layer.borderWidth = 1
        containerContentView.layer.cornerRadius = 12
        nameTextField.delegate = self
        submitButton.isEnabled = false
        userImageView.layer.cornerRadius = 12
    }

    func textFieldDidChangeSelection(_ textField: UITextField) {
        if let text = textField.text, !text.isEmpty {
            isTextFieldFilled = true
        } else {
            isTextFieldFilled = false
        }
        submitButton.isEnabled = isTextFieldFilled
    }

    //MARK: IBAction
    @IBAction private func chooseImageButtonTouchUpInside(_ sender: Any) {
        let chooseAvatar = ChooseAvatarViewController()
        chooseAvatar.delegate = self
        navigationController?.pushViewController(chooseAvatar, animated: true)
    }

    @IBAction private func submitButtonTouchUpInside(_ sender: Any) {
        guard let name = nameTextField.text else { return }
        guard !name.isEmpty else { return  }
        submitButton.isEnabled = true
        delegate?.controller(controller: self, action: .inforUser(name: nameTextField.text ?? "", image: viewModel.imageUser, gender: viewModel.gender))
        navigationController?.popViewController(animated: true)
    }
}

//MARK: ChooseAvatarViewControllerDelegate
extension CreateUserViewController: ChooseAvatarViewControllerDelegate {
    func controller(_ controller: ChooseAvatarViewController, action: ChooseAvatarViewController.Action) {
        switch action {
        case let .chooseImage(image, sex):
            userImageView.image = image
            viewModel.imageUser = image
            viewModel.gender = sex
        }
    }
}
