//
//  BaseNaviController.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 3/31/21.
//

import Foundation
import UIKit

class BaseNaviController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let navBar = self.navigationBar
        navBar.isTranslucent = false
        navBar.backgroundColor = .white

    }
    
}
