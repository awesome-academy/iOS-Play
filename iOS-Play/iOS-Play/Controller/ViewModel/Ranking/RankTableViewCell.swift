//
//  RankTableViewCell.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 4/10/21.
//

import UIKit
import Reusable

final class RankTableViewCell: UITableViewCell, NibReusable {

    @IBOutlet private weak var rankNumberLabel: UILabel!
    @IBOutlet private weak var appImage: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var artitsNameLabel: UILabel!
    @IBOutlet private weak var rateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configViews()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configViews() {
        appImage.layer.cornerRadius = 15
        appImage.image = Asset.loll.image
        nameLabel.text = "Wild Rift"
        artitsNameLabel.text = "SheepofG"
    }
    
    func configure(with model: FeedResults, rank: String, image: UIImage) {
        appImage.image = image
        rankNumberLabel.text = rank
        nameLabel.text = model.name
        artitsNameLabel.text = model.artistName
        
        let rateNumber = Double.random(in: 4...5)
        let mbNumber = Double.random(in: 500...800)
        
        rateLabel.text = "\(String(format: "%.2f", rateNumber))* - \(String(format: "%.2f", mbNumber))MB"
    }
}
