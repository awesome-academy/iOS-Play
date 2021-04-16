//
//  AppleTVCollectionViewCell.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 4/15/21.
//

import UIKit
import Reusable

final class AppleTVCollectionViewCell: UICollectionViewCell, NibReusable {
    
    @IBOutlet private weak var image: UIImageView!
    @IBOutlet private weak var name: UILabel!
    @IBOutlet private weak var artistName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        configView()
    }
    
    func configView() {
        image.layer.cornerRadius = 15
        
    }
    
    func configure(model: FeedResults) {
        image.setImage(urlString: model.artworkUrl100)
        name.text = model.name
        artistName.text = model.artistName
    }
}
