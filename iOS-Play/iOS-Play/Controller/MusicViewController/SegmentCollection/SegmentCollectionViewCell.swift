//
//  SegmentCollectionViewCell.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 4/10/21.
//

import UIKit
import Reusable

final class SegmentCollectionViewCell: UICollectionViewCell, NibReusable {

    @IBOutlet weak private var feedTypeLabel: UILabel!
    @IBOutlet weak private var pickedView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        configViews()
    }

    func configViews() {
        pickedView.layer.cornerRadius = 3
    }
    
    func configure(feedType: String, color: UIColor, picked: Bool) {
        feedTypeLabel.text = feedType
        pickedView.backgroundColor = picked ? .systemPink : color
        feedTypeLabel.textColor = picked ? .systemPink : .darkGray
    }
}
