//
//  TableViewCell.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 4/9/21.
//

import UIKit
import Reusable

protocol CollectionTableViewCellDelegate: class {
    func didSelectCell(model: FeedResults)
}

class CollectionTableViewCell: UITableViewCell, NibReusable {

    @IBOutlet weak var collectionView: UICollectionView!
    
    public weak var delegate: CollectionTableViewCellDelegate?
    
    private var models = [FeedResults]()
    
    private var apiManager = APIManager.shared
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configViews()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configViews() {
        collectionView.do {
            $0.backgroundColor = .white
            $0.delegate = self
            $0.dataSource = self
            $0.register(cellType: CollectionViewCell.self)
            $0.showsVerticalScrollIndicator = false
            $0.showsHorizontalScrollIndicator = false
            let layout = UICollectionViewFlowLayout().then {
                $0.scrollDirection = .horizontal
                $0.itemSize = CGSize(width: 120, height: 230)
                $0.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
                $0.minimumLineSpacing = 0
                $0.minimumInteritemSpacing = 1
            }
            $0.collectionViewLayout = layout
        }
    }
    
    public func configureData(with models: [FeedResults]) {
        self.models = models
        collectionView.reloadData()
    }
}


extension CollectionTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = models[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(for: indexPath) as CollectionViewCell
        
        apiManager.getImage(results: model) { (data, error) -> (Void) in
            var image = Asset.braw.image
            if let data = data {
                image = UIImage(data: data) ?? Asset.backWhite.image
            }

            DispatchQueue.main.async {
                cell.configure(with: model, image: image)
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let model = models[indexPath.row]
        delegate?.didSelectCell(model: model)
    }
}
