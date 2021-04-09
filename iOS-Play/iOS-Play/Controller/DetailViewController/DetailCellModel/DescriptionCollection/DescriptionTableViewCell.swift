//
//  DescriptionTableViewCell.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 4/8/21.
//

import Foundation
import UIKit
import Reusable

final class DescriptionTableViewCell: UITableViewCell, NibReusable {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    private var models = [DescriptionCollectionCellModel]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configViews()
    }
    
    func configViews() {
        
        collectionView.do {
            $0.backgroundColor = .white
            $0.delegate = self
            $0.dataSource = self
            $0.register(cellType: DescriptionCollectionViewCell.self)
            $0.showsVerticalScrollIndicator = false
            $0.showsHorizontalScrollIndicator = false
            let layout = UICollectionViewFlowLayout().then {
                $0.scrollDirection = .horizontal
                $0.itemSize = CGSize(width: 110, height: 40)
                $0.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
                $0.minimumLineSpacing = 0
                $0.minimumInteritemSpacing = 0
            }
            $0.collectionViewLayout = layout
        }
    }
    
    func configure(with model : [DescriptionCollectionCellModel]) {
        self.models = model
        collectionView.reloadData()
    }
}

extension DescriptionTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = models[indexPath.row]
        let cell = collectionView.dequeueReusableCell(for: indexPath) as DescriptionCollectionViewCell
        cell.configure(with: model)
        return cell
    }
}


