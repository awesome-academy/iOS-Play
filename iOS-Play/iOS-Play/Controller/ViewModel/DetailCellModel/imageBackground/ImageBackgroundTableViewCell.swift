//
//  ImageBackgroundTableViewCell.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 4/13/21.
//

import UIKit
import Reusable

final class ImageBackgroundTableViewCell: UITableViewCell, NibReusable {

    @IBOutlet weak private var backgroundImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configure(model: ImageBackgourndCellModel) {
        backgroundImage.image = model.image
    }
}
