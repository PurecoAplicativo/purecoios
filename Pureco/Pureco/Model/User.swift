//
//  User.swift
//  Pureco
//
//  Created by Giovani Pereira on 23/09/18.
//  Copyright © 2018 Pureco. All rights reserved.
//

import Foundation

final class User {
    var name: String
    var cpf: String
    var userId: String
    var imageURL: URL?
    var addressStreet: String
    var zipCode: String
    var neighbourhood: String

    init(name: String,
         cpf: String,
         userId: String,
         imageURL: URL?,
         street: String,
         zip: String,
         neighbourhood: String) {
        self.name = name
        self.userId = userId
        self.imageURL = imageURL
        self.zipCode = zip
        self.addressStreet = street
        self.neighbourhood = neighbourhood
        self.cpf = cpf
    }
}

class CurrentUser {
    static var user: User?
}
