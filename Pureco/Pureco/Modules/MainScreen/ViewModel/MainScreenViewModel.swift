//
//  MainScreenViewModel.swift
//  Pureco-Drop
//
//  Created by Giovani Pereira on 22/09/18.
//  Copyright © 2018 Giovani Pereira. All rights reserved.
//

import Foundation

class MainScreenViewModel {
    
    var isLoggedIn: Bool
    var lastSchedules: [Cleaning]?
    
    init(isLoggedIn: Bool, lastSchedules: [Cleaning]?) {
        self.isLoggedIn = isLoggedIn
        self.lastSchedules = lastSchedules
    }
}
