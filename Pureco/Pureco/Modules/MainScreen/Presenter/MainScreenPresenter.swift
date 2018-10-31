//
//  MainScreenPresenter.swift
//  Pureco
//
//  Created by Giovani Pereira on 22/09/18.
//  Copyright © 2018 Pureco. All rights reserved.
//

import Foundation

class MainScreenPresenter: MainScreenPresenterProtocol {
    weak var view: MainScreenViewProtocol?

    init(view: MainScreenViewProtocol) {
        self.view = view
    }

    func didLoad() {
        view?.startLoading()
        Services.getMainScreenInfo(completion: { (model, error)  in
            if let error = error {
                print(error.localizedDescription)
            }
            self.view?.viewModel = model
            DispatchQueue.main.async {
                self.view?.stopLoading()
                self.view?.setup()
            }
        })
        Services.updateUser()
    }
}
