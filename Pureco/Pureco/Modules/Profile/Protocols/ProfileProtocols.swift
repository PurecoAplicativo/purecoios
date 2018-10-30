//
//  ProfilePresenterProtocol.swift
//  Pureco
//
//  Created by Giovani Pereira on 29/09/18.
//  Copyright © 2018 Pureco. All rights reserved.
//

import UIKit

protocol ProfilePresenterProtocol: class {
    
    var view: ProfileViewProtocol? { get }
    func didLoad()
    func savePressed()
}

protocol ProfileViewProtocol: NSObjectProtocol {
    
    var presenter: ProfilePresenterProtocol? { get set }
    var viewModel: ProfileViewModel? { get set }
    var changedUser: User { get }
    
    func setup()
    func startLoading()
    func stopLoading()
    func closeView()
    func invalidateCPF()
}
