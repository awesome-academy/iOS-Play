//
//  HotTrackTableViewCell.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 4/10/21.
//

import UIKit
import Reusable

final class HotTrackTableViewCell: UITableViewCell, NibReusable {

    @IBOutlet weak private var collectionView: UICollectionView!
    
    private var models = [FeedResults]()
    
    public weak var delegate: CollectionTableViewCellDelegate?
    
    private var imageCornerRadius: CGFloat = 10 {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configCollection()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func configCollection() {
        collectionView.do {
            $0.delegate = self
            $0.dataSource = self
            $0.showsVerticalScrollIndicator = false
            $0.showsHorizontalScrollIndicator = false
            $0.register(cellType: MusicCollectionViewCell.self)
            
            let layout = UICollectionViewFlowLayout().then {
                $0.scrollDirection = .horizontal
                $0.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                $0.itemSize = CGSize(width: 140, height: 280)
                $0.minimumLineSpacing = 0
                $0.minimumInteritemSpacing = 0
            }
            
            $0.collectionViewLayout = layout
        }
    }
    
    func configure(with models: [FeedResults]) {
        self.models = models
        collectionView.reloadData()
    }
    
    func setImageCornerRadius(with cornerRadius: CGFloat) {
        self.imageCornerRadius = cornerRadius
    }
}

extension HotTrackTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = models[indexPath.row]
        let cell = collectionView.dequeueReusableCell(for: indexPath) as MusicCollectionViewCell
        cell.configure(with: model, imageConerRadius: imageCornerRadius)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let model = models[indexPath.row]
        delegate?.didSelectCell(model: model)
    }
}
