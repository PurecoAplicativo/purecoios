//
//  ViewController.swift
//  Pureco-Drop
//
//  Created by Giovani Pereira on 22/09/18.
//  Copyright © 2018 Giovani Pereira. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var schedulingCard: ScheduleCleaningCard!
    @IBOutlet weak var lasrCleaningsCard: PreviousCleaningCard!
    
    // MARK: - Variables
    
    var presenter: MainScreenPresenterProtocol?
    var viewModel: MainScreenViewModel?
    var loadingScreen: UIView?

    // MARK: - UIViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = MainScreenPresenter(view: self)
        presenter?.didLoad()
    }
    
}

// MARK: - MainScreenViewProtocol

extension MainScreenViewController: MainScreenViewProtocol {
    
    func startLoading() {
        self.view.isUserInteractionEnabled = false
        loadingScreen = self.showFullScreenLoading()
        showWarning(title: "Carregando...")
    }
    
    func stopLoading() {
        self.view.isUserInteractionEnabled = true
        loadingScreen?.removeFromSuperview()
        showWarning(title: "Finished Loading", twoLined: false)
    }
    
    func setup() {
        (viewModel?.isLoggedIn)! ? schedulingCard.setValid() : schedulingCard.setInvalid()
        lasrCleaningsCard.setup(cleaning: viewModel?.lastSchedules?.first)
    }
}
