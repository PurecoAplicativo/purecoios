//
//  RoundImageView.swift
//  Pureco-Drop
//
//  Created by Giovani Pereira on 22/09/18.
//  Copyright © 2018 Giovani Pereira. All rights reserved.
//

import UIKit

@IBDesignable class CorneredImageView: UIImageView {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }

}
