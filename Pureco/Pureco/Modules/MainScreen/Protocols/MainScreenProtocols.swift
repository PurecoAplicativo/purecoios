//
//  Protocols.swift
//  Pureco-Drop
//
//  Created by Giovani Pereira on 22/09/18.
//  Copyright © 2018 Giovani Pereira. All rights reserved.
//

import Foundation

protocol MainScreenViewProtocol: NSObjectProtocol {
    var presenter: MainScreenPresenterProtocol? { get }
    var viewModel: MainScreenViewModel? { get set }

    func startLoading()
    func stopLoading()
    func setup()
}

protocol MainScreenPresenterProtocol: class {
    var view: MainScreenViewProtocol? { get }
    func didLoad()
}
