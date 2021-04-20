//
//  HighlightViewCell.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 4/3/21.
//

import Foundation
import UIKit
import Reusable

final class HighlightCollectionViewCell: UICollectionViewCell, Reusable {

    let highlightImage = UIImageView().then {
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 15
        $0.contentMode = .scaleAspectFill
    }
    
    private let appImage = UIImageView().then {
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
    }
    
    private let appNameLabel = UILabel().then {
        $0.numberOfLines = 0
        $0.contentMode = .topLeft
        $0.font = FontFamily.Arvo.bold.font(size: 14)
        $0.textColor = .darkGray
    }
    
    private let nameAuthorLabel = UILabel().then {
        $0.numberOfLines = 0
        $0.contentMode = .topLeft
        $0.font = FontFamily.Arvo.regular.font(size: 14)
        $0.textColor = .darkGray
    }
    
    private let releaseLabel = UILabel().then {
        $0.numberOfLines = 0
        $0.contentMode = .topLeft
        $0.font = FontFamily.Arvo.regular.font(size: 14)
        $0.textColor = .darkGray
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configViews()
    }
    
    func configViews() {
        contentView.addSubview(highlightImage)
        contentView.addSubview(appImage)
        contentView.addSubview(appNameLabel)
        contentView.addSubview(nameAuthorLabel)
        contentView.addSubview(releaseLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        highlightImage.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().inset(10)
            make.width.equalTo(300)
            make.height.equalTo(150)
        }
        
        appImage.snp.makeConstraints { (make) in
            make.width.height.equalTo(80)
            make.top.equalTo(highlightImage.snp.bottom).offset(10)
            make.left.equalToSuperview().inset(10)
        }
        
        appNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(highlightImage.snp.bottom).offset(10)
            make.left.equalTo(appImage.snp.right).offset(20)
            make.right.equalToSuperview()
        }
        
        nameAuthorLabel.snp.makeConstraints { (make) in
            make.top.equalTo(appNameLabel.snp.bottom).offset(10)
            make.left.equalTo(appImage.snp.right).offset(20)
            make.right.equalToSuperview()
        }
        
        releaseLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameAuthorLabel.snp.bottom)
            make.left.equalTo(appImage.snp.right).offset(20)
            make.right.equalToSuperview()
        }
    }
    
    func configure (with model: HighlightTableCellModel) {
        
        if !model.artworkUrl100.isEmpty {
            highlightImage.image = Asset.wwdc2.image
            appImage.setImage(urlString: model.artworkUrl100)
        } else {
            highlightImage.image = model.highlightImage
            appImage.image = model.image
        }
        appNameLabel.text = model.name
        nameAuthorLabel.text = model.artistName
        releaseLabel.text = model.releaseDate
    }
}
