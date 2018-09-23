//
//  ViewController.swift
//  Pureco-Drop
//
//  Created by Giovani Pereira on 22/09/18.
//  Copyright © 2018 Giovani Pereira. All rights reserved.
//

import UIKit
import Kingfisher

class MainScreenViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var schedulingCard: ScheduleCleaningCard!
    @IBOutlet weak var lasrCleaningsCard: PreviousCleaningCard!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillDisappear(animated)
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
    }
    
    func setup() {
        if viewModel?.isLoggedIn == false {
            schedulingCard.setInvalid()
            self.profileImage.image = #imageLiteral(resourceName: "photoPlaceholder")
            nameLabel.text = "Log In"
            self.loginButton.setTitle("Entre para poder fazer agendamentos", for: .normal)
        } else {
            schedulingCard.setValid()
            self.nameLabel.text = CurrentUser.user?.name
            self.profileImage.kf.setImage(with: CurrentUser.user?.imageURL)
            self.loginButton.setTitle("Editar perfil", for: .normal)
        }
        lasrCleaningsCard.setup(cleaning: viewModel?.lastSchedules?.first)
    }
}
