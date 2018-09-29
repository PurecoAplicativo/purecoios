//
//  ProfilePresenter.swift
//  Pureco
//
//  Created by Giovani Pereira on 29/09/18.
//  Copyright © 2018 Pureco. All rights reserved.
//

import Foundation

class ProfilePresenter: ProfilePresenterProtocol {
    
    var view: ProfileViewProtocol?
    
    init (_ view: ProfileViewProtocol) {
        self.view = view
    }
    
    func didLoad() {
        view?.startLoading()
        Services.getProfileInformation { (model, error) in
            if error != nil {
                // treat error
            } else {
                self.view?.viewModel = model
                DispatchQueue.main.async {
                    self.view?.setup()
                    self.view?.stopLoading()
                }
            }
        }
    }
    
    func savePressed() {
        // Sava Data
        view?.closeView()
    }
    
}
