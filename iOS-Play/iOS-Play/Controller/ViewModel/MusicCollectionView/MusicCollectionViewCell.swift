//
//  MusicCollectionViewCell.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 4/10/21.
//

import UIKit
import Reusable

final class MusicCollectionViewCell: UICollectionViewCell, NibReusable {

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var artistNameLabel: UILabel!
    @IBOutlet private weak var releaseDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configViews()
    }
    
    func configViews() {
        imageView.layer.cornerRadius = 15
    }
    
    func configure(with model: FeedResults, image: UIImage) {
        imageView.setImage(urlString: model.artworkUrl100)
        nameLabel.text = model.name
        artistNameLabel.text = model.artistName
        releaseDateLabel.text = model.releaseDate
    }
}
