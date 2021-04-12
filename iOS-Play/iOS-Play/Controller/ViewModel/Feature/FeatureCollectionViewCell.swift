//
//  FeatureCollectionViewCell.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 4/10/21.
//

import UIKit
import Reusable

final class FeatureCollectionViewCell: UICollectionViewCell, NibReusable {

    @IBOutlet private weak var featureLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with model: Features) {
        featureLabel.text = model.feature
    }
}
