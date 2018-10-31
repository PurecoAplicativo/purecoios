//
//  PurecoLoaderImageView.swift
//  Pureco
//
//  Created by Giovani Pereira on 22/09/18.
//  Copyright © 2018 Pureco. All rights reserved.
//

import UIKit

class PurecoLoaderImageView: UIImageView {
    let images: [UIImage] = [#imageLiteral(resourceName: "loading_pureco00"), #imageLiteral(resourceName: "loading_pureco01"), #imageLiteral(resourceName: "loading_pureco02"), #imageLiteral(resourceName: "loading_pureco03"), #imageLiteral(resourceName: "loading_pureco04"), #imageLiteral(resourceName: "loading_pureco05"), #imageLiteral(resourceName: "loading_pureco06"), #imageLiteral(resourceName: "loading_pureco07"), #imageLiteral(resourceName: "loading_pureco08"), #imageLiteral(resourceName: "loading_pureco09"), #imageLiteral(resourceName: "loading_pureco10")]

    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        accessibilityHint = "Carregando"
        contentMode = .scaleAspectFill
        animationImages = images
        startAnimating()
    }
}
