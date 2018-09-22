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
    }
    
    func didLoad() {
        view?.startLoading()
        service?.getMainScreenInfo(completion: { (model) in
            self.view?.viewModel = model
            self.view?.stopLoading()
        })
    }
    
}
