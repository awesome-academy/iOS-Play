//
//  TVShowTableViewCell.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 4/16/21.
//

import UIKit
import Reusable

final class TVShowTableViewCell: UITableViewCell, NibReusable {

    @IBOutlet private weak var backgroundImage: UIImageView!
    @IBOutlet private weak var showImage: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    
    var download: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(model: FeedResults) {
        showImage.setImage(urlString: model.artworkUrl100 ?? "")
        nameLabel.text = model.name ?? "TV Show"
    }
    @IBAction func downloadTapped(_ sender: Any) {
        download?()
    }
}
