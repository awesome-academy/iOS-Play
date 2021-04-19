//
//  GenreTableViewCell.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 4/17/21.
//

import UIKit
import Reusable

final class GenreTableViewCell: UITableViewCell, NibReusable {

    @IBOutlet private weak var appImage: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var releaseDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(model: FeedResults) {
        appImage.setImage(urlString: model.artworkUrl100)
        nameLabel.text = model.name
        releaseDateLabel.text = model.releaseDate
    }
}
