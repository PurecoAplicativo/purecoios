//
//  RoundImageView.swift
//  Pureco-Drop
//
//  Created by Giovani Pereira on 22/09/18.
//  Copyright © 2018 Giovani Pereira. All rights reserved.
//

import UIKit

@IBDesignable class RoundImageView: UIImageView {

    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.layer.cornerRadius = self.frame.width / 2.0
        self.clipsToBounds = true
    }

}
