//
//  OnboardingViewController.swift
//  Pureco
//
//  Created by Giovani Pereira on 04/10/18.
//  Copyright © 2018 Pureco. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController {
    var delegate: OnboardingViewNavigationDelegate?

    @IBAction func didPressLocation(sender: Any) {
    }

    @IBAction func didPressNotifications(sender: Any) {
    }

    @IBAction func didPressNext(sender: Any) {
        delegate?.didPressNext()
    }
}

protocol OnboardingViewNavigationDelegate {
    func didPressNext()
}
