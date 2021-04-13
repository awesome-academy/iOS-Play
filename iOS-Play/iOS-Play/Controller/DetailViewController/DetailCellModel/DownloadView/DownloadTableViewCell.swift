//
//  DownloadTableViewCell.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 4/9/21.
//

import UIKit
import Reusable

final class DownloadTableViewCell: UITableViewCell, NibReusable {

    @IBOutlet weak private var backgroundImage: UIImageView!
    @IBOutlet weak private var casualView: UIView!
    @IBOutlet weak private var playerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configViews()
    }
    
    func configViews() {
        
        casualView.setBorder(width: 1, color: UIColor.gray)
        playerView.setBorder(width: 1, color: UIColor.gray)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with backgroundImage: UIImage) {
        self.backgroundImage.image = backgroundImage
    }
}
