//
//  Services.swift
//  Pureco
//
//  Created by Giovani Pereira on 23/09/18.
//  Copyright © 2018 Pureco. All rights reserved.
//

import Foundation

class Services {
    static var mainScreenMechanism = MainScreenServiceMock()
    static var lastCleaningsMechanism = LastCleaningServiceMock()

    static func updateUser() {
        DispatchQueue.global(qos: .background).async {
            CurrentUser.user = UserMock().getUser()
        }
    }
}

extension Services: UserServiceProtocol {
    static func getMainScreenInfo(completion: @escaping (MainScreenViewModel?, Error?) -> Void) {
        var model: MainScreenViewModel?
        var requestError: Error?

        DispatchQueue.global(qos: .background).async {
            do {
                try model = mainScreenMechanism.getMainScreenInfo()
            } catch {
                requestError = error
            }
            completion(model, requestError)
        }
    }
}

extension Services: LastSchedulesProtocol {
    static func getLastCleanings(completion: @escaping (LastCleaningsViewModel?, Error?) -> Void) {
        var model: LastCleaningsViewModel?
        var requestError: Error?

        DispatchQueue.global(qos: .background).async {
            do {
                try model = lastCleaningsMechanism.getLastCleanings()
            } catch {
                requestError = error
            }
            completion(model, requestError)
        }
    }
}

extension Services: ProfileServicesProtocol {
    static func getProfileInformation(completion: @escaping (ProfileViewModel?, Error?) -> Void) {
        var model: ProfileViewModel?
        var requestError: Error?

        DispatchQueue.global(qos: .background).async {
            if let user = CurrentUser.user {
                model = ProfileViewModel(user: user)
            } else {
                self.updateUser()
                if let user = CurrentUser.user {
                    model = ProfileViewModel(user: user)
                    requestError = nil
                }
            }
            completion(model, requestError)
        }
    }
}
