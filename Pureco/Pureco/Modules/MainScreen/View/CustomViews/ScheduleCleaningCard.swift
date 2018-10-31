//
//  ScheduleCleaningCard.swift
//  Pureco
//
//  Created by Giovani Pereira on 22/09/18.
//  Copyright © 2018 Pureco. All rights reserved.
//

import UIKit

class ScheduleCleaningCard: CardView {
    @IBOutlet var image: UIImageView?
    @IBOutlet var label: UILabel?
    @IBOutlet var button: UIButton?

    func setInvalid() {
        label?.textColor = UIColor.unactiveLabelGray
        image?.image = #imageLiteral(resourceName: "unactivePurecoLogo")
        button?.isUserInteractionEnabled = false
    }

    func setValid() {
        label?.textColor = UIColor.black
        image?.image = #imageLiteral(resourceName: "purecoLogoNormal")
        button?.isUserInteractionEnabled = true
    }
}
