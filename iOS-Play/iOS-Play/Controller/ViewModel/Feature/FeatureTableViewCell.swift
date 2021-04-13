//
//  FeatureTableViewCell.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 4/10/21.
//

import UIKit
import Reusable

final class FeatureTableViewCell: UITableViewCell, NibReusable {

    @IBOutlet private weak var collectionView: UICollectionView!
    
    private var models = [Features]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configViews()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configViews() {
        collectionView.do {
            $0.delegate = self
            $0.dataSource = self
            $0.showsVerticalScrollIndicator = false
            $0.showsHorizontalScrollIndicator = false
            $0.register(cellType: FeatureCollectionViewCell.self)
            let layout = UICollectionViewFlowLayout().then {
                $0.scrollDirection = .horizontal
                $0.itemSize = CGSize(width: 200, height: 110)
                $0.sectionInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
                $0.minimumLineSpacing = 20
                $0.minimumInteritemSpacing = 10
            }
            $0.collectionViewLayout = layout
        }
    }
    
    func configure(with models: [Features]) {
        self.models = models
        collectionView.reloadData()
    }
}

extension FeatureTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = models[indexPath.row]
        let cell = collectionView.dequeueReusableCell(for: indexPath) as FeatureCollectionViewCell
        cell.configure(with: model)
        return cell
    }
}
