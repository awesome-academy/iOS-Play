//
//  CommentTableCell.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 4/9/21.
//

import UIKit
import Reusable

final class CommentTableCell: UITableViewCell, NibReusable{

    @IBOutlet weak private var userImage: UIImageView!
    @IBOutlet weak private var commentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with model: CommentCellModel) {
        userImage.image = model.userImage
        commentLabel.text = model.commentString
    }
}
