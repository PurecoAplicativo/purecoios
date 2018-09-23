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
    var userId: String
    var imageURL: URL?
    
    init(name: String, userId: String, imageURL: URL?) {
        self.name = name
        self.userId = userId
        self.imageURL = imageURL
    }
    
}

class CurrentUser {
    static var user: User?
}
