//
//  MainScreenPresenter.swift
//  Pureco
//
//  Created by Giovani Pereira on 22/09/18.
//  Copyright © 2018 Pureco. All rights reserved.
//

import Foundation

class MainScreenPresenter: MainScreenPresenterProtocol {
    
    var view: MainScreenViewProtocol?
    var service: UserServiceProtocol?
    
    init(view: MainScreenViewProtocol) {
        self.view = view
        self.service = MainScreenServiceMock()
    }
    
    func didLoad() {
        view?.startLoading()
        service?.getMainScreenInfo(completion: { (model, error)  in
            if let error = error {
                print(error.localizedDescription)
            }
            self.view?.viewModel = model
            DispatchQueue.main.async {
                self.view?.stopLoading()
                self.view?.setup()
            }
        })
    }
    
}
