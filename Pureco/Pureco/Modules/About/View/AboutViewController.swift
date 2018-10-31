//
//  AboutViewController.swift
//  Pureco-Drop
//
//  Created by Giovani Pereira on 22/09/18.
//  Copyright © 2018 Giovani Pereira. All rights reserved.
//

import UIKit

let enactusURL = URL(string: "https://www.enactusunicamp.org")
let facebookURL = URL(string: "https://www.facebook.com/purecolimpeza/")

class AboutViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.contentSize = CGSize(width: contentView.frame.size.width,
                                        height: 2800)
    }

    @IBAction func didPressCloseButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func didPressEnactus(_ sender: Any) {
        guard let url = enactusURL else { return }
        UIApplication.shared.open(url)
    }

    @IBAction func didPressFacebookButton(_ sender: Any) {
        guard let url = facebookURL else { return }
        UIApplication.shared.open(url)
    }
}
