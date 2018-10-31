//
//  MainScreenServiceMock.swift
//  Pureco
//
//  Created by Giovani Pereira on 22/09/18.
//  Copyright © 2018 Pureco. All rights reserved.
//

import Foundation

class UserMock {
    func getUser() -> User {
        return User(name: "Gesonel",
                    cpf: "11122233319",
                    userId: "mestre_dos_disfarces",
                    imageURL: URL(string: "https://goo.gl/cZRhc8"),
                    street: "Rua 10",
                    zip: "xxx.xxx.xx-xxx",
                    neighbourhood: "Jardim Azul")
    }
}

class MainScreenServiceMock {
    func getMainScreenInfo() throws -> MainScreenViewModel {
        let semaphore  = DispatchSemaphore(value: 0)
        DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
            semaphore.signal()
        }
        semaphore.wait()
        return MainScreenViewModel(lastSchedules: [Cleaning(date: Date(),
                                                            address: "Dr Boareto de Camargo, 177 - Barão Geraldo",
                                                            cleaner: "Josefina")])
    }
}

class LastCleaningServiceMock {
    func getLastCleanings() throws -> LastCleaningsViewModel {
        let semaphore = DispatchSemaphore(value: 0)
        DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
            semaphore.signal()
        }
        semaphore.wait()
        return LastCleaningsViewModel(old: [Cleaning(date: Date(),
                                                     address: "Dr Boareto de Camargo, 177 - Campinas Barão Geraldo",
                                                     cleaner: "Josefina"),
                                            Cleaning(date: Date(),
                                                     address: "Dr Boareto de Camargo, 177 - Campinas Barão Geraldo",
                                                     cleaner: "Josefina"),
                                            Cleaning(date: Date(),
                                                     address: "Dr Boareto de Camargo, 177 - Campinas Barão Geraldo",
                                                     cleaner: "Josefina")],
                                      next: [Cleaning(date: Date(),
                                                      address: "Dr Boareto de Camargo, 177 - Campinas Barão Geraldo",
                                                      cleaner: "Josefina")])
    }
}
