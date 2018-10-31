//
//  Cleaning.swift
//  Pureco
//
//  Created by Giovani Pereira on 22/09/18.
//  Copyright © 2018 Pureco. All rights reserved.
//

import Foundation

class Cleaning {
    let date: Date
    let address: String
    let cleaner: String?

    var dateString: String {
        return DateFormatter.commonDateFormat.string(from: date)
    }

    init(date: Date, address: String, cleaner: String) {
        self.date = date
        self.address = address
        self.cleaner = cleaner
    }
}
