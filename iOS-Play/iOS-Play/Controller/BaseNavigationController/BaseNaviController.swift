//
//  BaseNaviController.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 3/31/21.
//

import Foundation
import UIKit
import Then

class BaseNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.do {
            $0.isTranslucent = false
            $0.backgroundColor = .white
        }
    }
}
