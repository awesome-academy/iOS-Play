//
//  ListMovieTableViewCell.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 4/13/21.
//

import UIKit
import Reusable

class ListMovieTableViewCell: UITableViewCell, NibReusable {

    @IBOutlet private weak var movieImage: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var artistLabel: UILabel!
    @IBOutlet private weak var releaseDateLabel: UILabel!
    @IBOutlet private weak var copyrightLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configViews()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configViews() {
        movieImage.layer.cornerRadius = 10
    }
    
    func configure(model: FeedResults) {
        movieImage.setImage(urlString: model.artworkUrl100)
        nameLabel.text = model.name
        artistLabel.text = model.artistName
        releaseDateLabel.text = model.releaseDate
        copyrightLabel.text = model.copyright
    }
}
