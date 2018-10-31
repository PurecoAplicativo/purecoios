//
//  ProfileViewController.swift
//  Pureco
//
//  Created by Giovani Pereira on 29/09/18.
//  Copyright © 2018 Pureco. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var cpfTextField: UITextField!
    @IBOutlet weak var zipCodeTextField: UITextField!
    @IBOutlet weak var neighbourhoodTextField: UITextField!
    @IBOutlet weak var streetTextField: UITextField!
    @IBOutlet weak var profileImage: RoundImageView!

    var loadingView: UIView?
    var viewModel: ProfileViewModel?
    var presenter: ProfilePresenterProtocol?

    var changedUser: User {
        return User(name: nameTextField.text ?? "",
                    cpf: cpfTextField.text ?? "",
                    userId: viewModel?.user.userId ?? "",
                    imageURL: viewModel?.user.imageURL, // TODO: Change when image changes
                    street: streetTextField.text ?? "",
                    zip: zipCodeTextField.text ?? "",
                    neighbourhood: neighbourhoodTextField.text ?? "")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter = ProfilePresenter(view: self)
        presenter?.didLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func closeView() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func imageTapped() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func didPressSaveButton(_ sender: Any) {
        presenter?.savePressed()
    }

    @IBAction func didPressImageButton(_ sender: Any) {
        imageTapped()
    }
    
    @IBAction func didPressLogoutButton(_ sender: Any) {
        // Perform logout
    }
}

extension ProfileViewController: ProfileViewProtocol {
    
    func startLoading() {
        loadingView = showFullScreenLoading()
    }
    
    func stopLoading() {
        loadingView?.removeFromSuperview()
    }
    
    func setup() {
        guard let model = self.viewModel else { return }
        nameTextField.text = model.user.name
        cpfTextField.text = model.user.userId
        zipCodeTextField.text = model.user.zipCode
        neighbourhoodTextField.text = model.user.neighbourhood
        streetTextField.text = model.user.addressStreet
        profileImage.kf.setImage(with: model.user.imageURL)
    }
    
    func invalidateCPF() {
        self.showWarning(title: "CPF Inválido")
        cpfTextField.backgroundColor = UIColor.lightRedWarning
    }
}

extension ProfileViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
// Local variable inserted by Swift 4.2 migrator.
let info = convertFromUIImagePickerControllerInfoKeyDictionary(info)

        if let image = info[convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.originalImage)] as? UIImage {
            self.profileImage.image = image
            picker.dismiss(animated: true, completion: nil)
        }
    }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKeyDictionary(_ input: [UIImagePickerController.InfoKey: Any]) -> [String: Any] {
	return Dictionary(uniqueKeysWithValues: input.map {key, value in (key.rawValue, value)})
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKey(_ input: UIImagePickerController.InfoKey) -> String {
	return input.rawValue
}
