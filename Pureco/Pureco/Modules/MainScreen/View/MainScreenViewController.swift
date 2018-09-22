//
//  ViewController.swift
//  Pureco-Drop
//
//  Created by Giovani Pereira on 22/09/18.
//  Copyright © 2018 Giovani Pereira. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    var presenter: MainScreenPresenterProtocol?
    var viewModel: MainScreenViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = MainScreenPresenter(view: self)
        presenter?.didLoad()
    }
    
}

extension MainScreenViewController: MainScreenViewProtocol {
    
    func startLoading() {
        self.view.isUserInteractionEnabled = false
    }
    
    func stopLoading() {
        self.view.isUserInteractionEnabled = true
    }
}
