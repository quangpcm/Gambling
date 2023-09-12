//
//  ChooseAvatar.swift
//  GameBling
//
//  Created by Dong Duong V. on 11/09/2023.
//

import UIKit
protocol ChooseAvatarViewControllerDelegate: AnyObject {
    func controller(_ controller: ChooseAvatarViewController, action: ChooseAvatarViewController.Action)
}

final class ChooseAvatarViewController: UIViewController {
    var imageU: UIImage?
    var sex: String = ""
    
    enum Action {
        case chooseImage(image:UIImage, gender: String )
    }
    
    weak var delegate: ChooseAvatarViewControllerDelegate?
    var viewModel: ChooseAvatarViewModel = ChooseAvatarViewModel()
    
    @IBOutlet private weak var submitButton: UIButton!
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        let cellNib = UINib(nibName: "AvatarCell", bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: "AvatarCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        submitButton.layer.cornerRadius = 12
        collectionView.reloadData()
    }
    
    @IBAction func submitButtonTouchUpInside(_ sender: Any) {
        if let selectedUserInfo = viewModel.selectedUserInfo, let image = selectedUserInfo.image {
            delegate?.controller(self, action: .chooseImage(image: image, gender: selectedUserInfo.gender))
            navigationController?.popViewController(animated: true)
        }
    }
}

//MARK: UICollectionViewDataSource
extension ChooseAvatarViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfItemInSection()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AvatarCell", for: indexPath) as? AvatarCell else { return AvatarCell()}
        cell.viewModel = viewModel.viewModelForChooseAvatar(at: indexPath)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.setSelectedUser(indexPath)
        submitButton.backgroundColor = .cyan
    }
}

//MARK: UICollectionViewDelegateFlowLayout
extension ChooseAvatarViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 100)
    }
}

