//
//  LastCleaningsTableViewCell.swift
//  Pureco
//
//  Created by Giovani Pereira on 23/09/18.
//  Copyright © 2018 Pureco. All rights reserved.
//

import UIKit

class LastCleaningsTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var cleanerLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    func setup(cleaning: Cleaning) {
        dateLabel.text = cleaning.dateString
        cleanerLabel.text = "Faxineira: " + (cleaning.cleaner ?? "")
        addressLabel.text = cleaning.address
    }

}
