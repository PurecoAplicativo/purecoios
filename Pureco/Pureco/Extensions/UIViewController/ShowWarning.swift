//
//  InternalAlertView.swift
//  Pureco
//
//  Created by Giovani Pereira on 22/09/18.
//  Copyright © 2018 Pureco. All rights reserved.
//

import UIKit

extension UIViewController {
    func showWarning(title: String, twoLined: Bool = false) {

        let label = twoLined ? UILabel(frame: CGRect(x: self.view.center.x - 125,
                                                     y: self.view.frame.maxY - 80, width: 250, height: 50)) :
                               UILabel(frame: CGRect(x: self.view.center.x - 100,
                                                     y: self.view.frame.maxY - 80, width: 200, height: 30))

        // Style
        label.textColor = .white
        label.backgroundColor = UIColor.purecoMediumBlue

        // Format text
        label.text = title
        label.numberOfLines = twoLined ? 2 : 1
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center

        // Rectangle
        label.layer.cornerRadius = 10
        label.clipsToBounds = true

        // Show and remove component
        view.addSubview(label)
        fadeOutComponent(label)
    }

    private func fadeOutComponent(_ view: UIView, timeInterval: Double = 2.0) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            UIView.animate(withDuration: timeInterval, animations: {
                view.alpha = 0
            }, completion: { _ in
                view.removeFromSuperview()
            })
        }
    }
}
