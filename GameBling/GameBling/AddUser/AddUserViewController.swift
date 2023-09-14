//
//  AddUserViewController.swift
//  GameBling
//
//  Created by Dong Duong V. on 11/09/2023.
//

import UIKit

final class AddUserViewController: UIViewController {

    //  MARK: PROPERTIES
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var containerTopView: UIView!
    @IBOutlet private weak var collectionView: UICollectionView!

    var viewModel: AddUserViewModel = AddUserViewModel()

    //  MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    private func configureUI() {
        titleLabel.text = "Add User"

        let cellNib = UINib(nibName: "UserCell", bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: "UserCell")

        collectionView.dataSource = self
        collectionView.delegate = self
    }

    //  MARK: @IBAction
    @IBAction private func addUserButtonTouchUpInside(_ sender: Any) {
        let createUser = CreateUserViewController()
        createUser.delegate = self
        navigationController?.pushViewController(createUser, animated: true)
    }
}

//  MARK: UICollectionViewDataSource
extension AddUserViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfItem()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserCell", for: indexPath) as? UserCell else { return UserCell() }
        cell.viewModel = viewModel.viewModelForUser(at: indexPath)
        return cell
    }
}

//  MARK: UICollectionViewDelegateFlowLayout
extension AddUserViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 150)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
}

//  MARK: CreateUserViewControllerDelegate
extension AddUserViewController: CreateUserViewControllerDelegate {

    func controller(controller: CreateUserViewController, action: CreateUserViewController.Action) {
        switch action {
        case let .inforUser(name, image, gender):
            let user = InforPlayer(name: name, image: image, gender: gender )
            viewModel.inforUsers.append(user)
            collectionView.reloadData()
        }
    }
}
