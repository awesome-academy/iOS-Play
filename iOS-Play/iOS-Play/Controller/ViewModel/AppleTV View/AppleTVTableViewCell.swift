//
//  AppleTVTableViewCell.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 4/15/21.
//

import UIKit
import Reusable

final class AppleTVTableViewCell: UITableViewCell, NibReusable {

    @IBOutlet private weak var backgroundImage: UIImageView!
    @IBOutlet weak private var collectionView: UICollectionView!
    
    private var models = [FeedResults]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    weak var delegate: CollectionTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configView() {
        
        collectionView.do {
            $0.backgroundView?.backgroundColor = UIColor.clear
            $0.backgroundColor = .clear
            $0.backgroundColor = .none
            $0.delegate = self
            $0.dataSource = self
            $0.showsVerticalScrollIndicator = false
            $0.showsHorizontalScrollIndicator = false
            $0.register(cellType: AppleTVCollectionViewCell.self)
            
            let layout = UICollectionViewFlowLayout().then {
                $0.scrollDirection = .horizontal
                $0.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
                $0.itemSize = CGSize(width: 200, height: 200)
                $0.minimumLineSpacing = 0
                $0.minimumInteritemSpacing = 0
            }
            
            $0.collectionViewLayout = layout
        }
    }
    
    func configure(models: [FeedResults]) {
        self.models = models
    }
}

extension AppleTVTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath) as AppleTVCollectionViewCell
        cell.configure(model: models[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let model = models[indexPath.row]
        delegate?.didSelectCell(model: model)
    }
}
