//
//  PreviousCleaningCard.swift
//  Pureco
//
//  Created by Giovani Pereira on 22/09/18.
//  Copyright © 2018 Pureco. All rights reserved.
//

import UIKit

class PreviousCleaningCard: CardView {
    
    @IBOutlet var warningLabel: UILabel?
    @IBOutlet var titleLabel: UILabel?
    @IBOutlet var lastCleaningLabel: UILabel?
    @IBOutlet var dateLabel: UILabel?
    @IBOutlet var addressLabel: UILabel?
    
    func setup(cleaning: Cleaning?) {
        guard let cleaning = cleaning else {
            warningLabel?.isHidden = false
            dateLabel?.text = ""
            addressLabel?.text = ""
            lastCleaningLabel?.text = ""
            return
        }
        warningLabel?.isHidden = true
        addressLabel?.text = cleaning.address
        dateLabel?.text = DateFormatter.commonDateFormat.string(from: cleaning.date)
    }
    
}
