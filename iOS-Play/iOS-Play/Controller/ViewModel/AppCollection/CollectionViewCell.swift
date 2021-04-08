//
//  CollectionViewCell.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 4/3/21.
//

import Foundation
import UIKit

final class CollectionViewCell: UICollectionViewCell {
    
    private let appImage = UIImageView().then {
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
    }
    
    private let nameLabel = UILabel().then {
        $0.numberOfLines = 0
        $0.contentMode = .topLeft
        $0.font = FontFamily.Arvo.bold.font(size: 14)
        $0.textColor = .darkGray
    }
    
    private let artistNameLabel = UILabel().then {
        $0.numberOfLines = 0
        $0.contentMode = .topLeft
        $0.font = FontFamily.Arvo.regular.font(size: 14)
        $0.textColor = .darkGray
    }
    
    private let releaseDateLabel = UILabel().then {
        $0.numberOfLines = 0
        $0.contentMode = .topLeft
        $0.font = FontFamily.Arvo.regular.font(size: 14)
        $0.textColor = .darkGray
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        contentView.do {
            $0.addSubview(appImage)
            $0.addSubview(nameLabel)
            $0.addSubview(artistNameLabel)
            $0.addSubview(releaseDateLabel)
        }
        
        appImage.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().inset(10)
            make.width.height.equalTo(100)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(appImage.snp.bottom).offset(5)
            make.left.right.equalToSuperview().inset(10)
        }
        
        artistNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.left.right.equalToSuperview().inset(10)
        }
        
        releaseDateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(artistNameLabel.snp.bottom)
            make.left.right.equalToSuperview().inset(10)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: FeedResults, image : UIImage) {
        appImage.image = image
        nameLabel.text = model.name
        artistNameLabel.text = model.artistName
        releaseDateLabel.text = model.releaseDate
    }
}
