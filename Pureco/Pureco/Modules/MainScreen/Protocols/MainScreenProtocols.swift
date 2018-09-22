//
//  Protocols.swift
//  Pureco-Drop
//
//  Created by Giovani Pereira on 22/09/18.
//  Copyright © 2018 Giovani Pereira. All rights reserved.
//

import Foundation

protocol MainScreenViewProtocol {
    
    // Cell controlling
    func didSelectScheduleCleaning()
    func didSelectPreviousCleanings()
    func didSelectKnowMore()
    func didSelectLogIn()
    
}

protocol MainScreenPresenterProtocol {
    
    // Cell controlling
    func didSelectScheduleCleaning()
    func didSelectPreviousCleanings()
    func didSelectKnowMore()
    func didSelectLogIn()
    
}
