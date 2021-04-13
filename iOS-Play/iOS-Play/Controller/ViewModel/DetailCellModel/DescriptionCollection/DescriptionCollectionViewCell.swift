//
//  DescriptionCollectionViewCell.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 4/9/21.
//

import UIKit
import Reusable

final class DescriptionCollectionViewCell: UICollectionViewCell, NibReusable {
    
    @IBOutlet weak private var aboveLabel: UILabel!
    @IBOutlet weak private var belowLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with model: DescriptionCollectionCellModel) {
        aboveLabel.text = model.aboveString
        belowLabel.text = model.belowString
    }
}
