//
//  ServiceProtocols.swift
//  Pureco
//
//  Created by Giovani Pereira on 22/09/18.
//  Copyright © 2018 Pureco. All rights reserved.
//

import Foundation

protocol UserServiceProtocol {
    func getMainScreenInfo(completion: (_ viewModel: MainScreenViewModel) -> Void)
}
