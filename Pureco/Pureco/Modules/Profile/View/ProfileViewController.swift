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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter = ProfilePresenter(self)
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
}

extension ProfileViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.profileImage.image = image
            picker.dismiss(animated: true, completion: nil)
        }
    }
}
