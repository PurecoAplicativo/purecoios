//
//  ServiceProtocols.swift
//  Pureco
//
//  Created by Giovani Pereira on 22/09/18.
//  Copyright © 2018 Pureco. All rights reserved.
//

import Foundation

protocol UserServiceProtocol {
    static func getMainScreenInfo(completion: @escaping (_ viewModel: MainScreenViewModel?, _ error: Error?) -> Void)
}

protocol LastSchedulesProtocol {
    static func getLastCleanings(completion: @escaping (_ viewModel: LastCleaningsViewModel?, _ error: Error?) -> Void)
}

protocol ProfileServicesProtocol {
    static func getProfileInformation(completion: @escaping (_ viewModel: ProfileViewModel?, _ error: Error?) -> Void)
}
