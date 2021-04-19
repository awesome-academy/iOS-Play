//
//  InfoTableViewCell.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 4/13/21.
//

import UIKit
import Reusable

class InfoTableViewCell: UITableViewCell, NibReusable {

    @IBOutlet weak private var firstKindLabel: UILabel!
    @IBOutlet weak private var secondKindLabel: UILabel!
    @IBOutlet var views: [UIView]!
    @IBOutlet weak var feedTypeLabel: UILabel!
    
    var buttonTapped: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configView() {
        for view in views {
            view.setBorder(width: 1, color: .gray)
        }
    }
    
    func configure(model: InfoCellModel, feedtype: String) {
        firstKindLabel.text = model.firstKind
        secondKindLabel.text = model.secondKind
        feedTypeLabel.text = feedtype
    }
    
    
    @IBAction func rentButtonTapped(_ sender: Any) {
        buttonTapped?()
    }
    @IBAction func buyButtonTapped(_ sender: Any) {
        buttonTapped?()
    }
    
}
