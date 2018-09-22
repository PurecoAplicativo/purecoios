//
//  ShowFullScreenLoading.swift
//  Pureco
//
//  Created by Giovani Pereira on 22/09/18.
//  Copyright © 2018 Pureco. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showFullScreenLoading() -> UIView {
        
        let view = UIView(frame: self.view.frame)
        view.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        let activity = UIActivityIndicatorView(frame: .zero)
        
        self.view.addSubview(view)
        
        activity.startAnimating()
        view.addSubview(activity)
        activity.center = view.center
        activity.activityIndicatorViewStyle = .whiteLarge
        
        return view
        
    }
    
}
