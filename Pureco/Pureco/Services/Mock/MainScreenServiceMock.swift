//
//  MainScreenServiceMock.swift
//  Pureco
//
//  Created by Giovani Pereira on 22/09/18.
//  Copyright © 2018 Pureco. All rights reserved.
//

import Foundation

class MainScreenServiceMock: UserServiceProtocol {
    
    func getMainScreenInfo(completion: (MainScreenViewModel) -> Void) {
        completion( MainScreenViewModel(isLoggedIn: false, lastSchedules: [Cleaning(date: Date(), address: "Rua Doutor Boareto de Camargo, 177 - Campinas Barão Geraldo")]) )
    }
}
