//
//  LastCleaningsViewModel.swift
//  Pureco
//
//  Created by Giovani Pereira on 23/09/18.
//  Copyright © 2018 Pureco. All rights reserved.
//

import Foundation

class LastCleaningsViewModel {
    var oldCleanings: [Cleaning]
    var nextCleanings: [Cleaning]

    init(old: [Cleaning], next: [Cleaning]) {
        self.nextCleanings = next
        self.oldCleanings = old
    }
}
