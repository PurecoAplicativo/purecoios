//
//  LastCleaningPresenter.swift
//  Pureco
//
//  Created by Giovani Pereira on 23/09/18.
//  Copyright © 2018 Pureco. All rights reserved.
//

import Foundation

class LastCleaningPresenter: LastCleaningPresenterProtocol {
    weak var view: LastCleaningViewControllerProtocol?
    
    init(view: LastCleaningViewControllerProtocol) {
        self.view = view
    }
    
    func didLoad() {
        //
    }
    
}
