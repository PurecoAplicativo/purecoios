//
//  ShowFullScreenLoading.swift
//  Pureco
//
//  Created by Giovani Pereira on 22/09/18.
//  Copyright © 2018 Pureco. All rights reserved.
//

import UIKit

extension UIViewController {
    var activityIndicatorLargeWhite: UIView {
        let activity = UIActivityIndicatorView(frame: .zero)
        activity.startAnimating()
        activity.center = view.center
        activity.style = .whiteLarge
        return activity
    }

    var purecoActivity: UIView {
        let purecoActivity = PurecoLoaderImageView(image: #imageLiteral(resourceName: "loading_pureco10"))
        purecoActivity.center = view.center
        purecoActivity.animationDuration = 1.87
        return purecoActivity
    }

    func showFullScreenLoading(purecoStyle: Bool = true) -> UIView {
        let view = UIVisualEffectView(frame: self.view.frame)
        view.effect = UIBlurEffect(style: .light)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.contentView.addSubview(purecoStyle ? purecoActivity : activityIndicatorLargeWhite )
        self.view.addSubview(view)

        return view
    }
}
