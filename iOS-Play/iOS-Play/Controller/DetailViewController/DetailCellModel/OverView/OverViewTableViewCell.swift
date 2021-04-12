//
//  OverViewTableViewCell.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 4/9/21.
//

import UIKit
import Reusable

final class OverViewTableViewCell: UITableViewCell, NibReusable {

    @IBOutlet weak private var appImage: UIImageView!
    @IBOutlet weak private var nameLabel: UILabel!
    @IBOutlet weak private var rightCopyLabel: UILabel!
    @IBOutlet weak private var releaseDateLabel: UILabel!
    @IBOutlet weak private var artitstNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func configure(with model: OverViewTableCellModel, image : UIImage) {
        appImage.image = image
        nameLabel.text = model.name
        rightCopyLabel.text = model.copyright
        releaseDateLabel.text = model.releaseDate
        artitstNameLabel.text = model.artistName
    }
    
}
