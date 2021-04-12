//
//  Extension.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 4/9/21.
//

import Foundation
import UIKit

extension UIView {
    func setBorder (width: CGFloat, color: UIColor) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
}
