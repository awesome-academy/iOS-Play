//
//  CollectionViewCellss.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 4/9/21.
//

import UIKit
import Reusable

class CollectionViewCell: UICollectionViewCell, NibReusable {
    
    @IBOutlet private weak var appImage: UIImageView!
    @IBOutlet private weak var appNameLabel: UILabel!
    @IBOutlet private weak var artitsNameLabel: UILabel!
    @IBOutlet private weak var releaseDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with model: FeedResults, image : UIImage) {
        appImage.image = image
        appNameLabel.text = model.name
        artitsNameLabel.text = model.artistName
        releaseDateLabel.text = model.releaseDate
    }

}
