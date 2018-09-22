//
//  Protocols.swift
//  Pureco-Drop
//
//  Created by Giovani Pereira on 22/09/18.
//  Copyright © 2018 Giovani Pereira. All rights reserved.
//

import Foundation

protocol MainScreenViewProtocol {
    
    var presenter: MainScreenPresenterProtocol? { get }
    var viewModel: MainScreenViewModel? { get set }
    
    func startLoading()
    func stopLoading()
    func setup()
    
}

protocol MainScreenPresenterProtocol {
    
    var view: MainScreenViewProtocol? { get }
    func didLoad()
    
}
