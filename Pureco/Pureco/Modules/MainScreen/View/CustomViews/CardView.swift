//
//  CardView.swift
//  Pureco-Drop
//
//  Created by Giovani Pereira on 22/09/18.
//  Copyright © 2018 Giovani Pereira. All rights reserved.
//

import UIKit

class CardView: UIView {

    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.layer.cornerRadius = 10
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.1
        self.layer.shadowRadius = 10
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
    }

}
