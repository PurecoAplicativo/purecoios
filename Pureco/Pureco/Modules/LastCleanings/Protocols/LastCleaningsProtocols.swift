//
//  LastCleaningsProtocols.swift
//  Pureco
//
//  Created by Giovani Pereira on 23/09/18.
//  Copyright © 2018 Pureco. All rights reserved.
//

import Foundation

protocol LastCleaningViewControllerProtocol: NSObjectProtocol {
    var presenter: LastCleaningPresenterProtocol? { get }
    var viewModel: LastCleaningsViewModel? { get set }

    func startLoading()
    func stopLoading()
    func setup()
}

protocol LastCleaningPresenterProtocol: class {
    var view: LastCleaningViewControllerProtocol? { get }
    func didLoad()
}
