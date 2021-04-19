//
//  NewGameViewController.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 4/2/21.
//

import Foundation
import UIKit

final class NewGameViewController: UIViewController {
    
    private let tableView = UITableView(frame: .zero, style: .plain).then {
        $0.register(cellType: CollectionTableViewCell.self)
        $0.register(cellType: GenreViewCell.self)
        $0.register(cellType: HighlighTableViewCell.self)
        $0.register(cellType: BannerViewTableCell.self)
        $0.showsVerticalScrollIndicator = false
        $0.showsHorizontalScrollIndicator = false
        $0.separatorColor = .clear
    }
    
    private let dataMock = DataMock.shared
    
    private var models = [CellModel]()
    
    private let apiManager = APIManager.shared
    
    private var results : [FeedResults] = []
    
    private let heightOfGenre: CGFloat = 30
    private let heightOfCollection: CGFloat = 230
    private let heightOfHighlight: CGFloat = 280
    private let heightOfBanner: CGFloat = 310
    private let heightOfList: CGFloat = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configViews()
        restApi()
    }
    
    func configViews() {
        view.backgroundColor = .white
        
        tableView.do {
            $0.delegate = self
            $0.dataSource = self
        }
        
        view.addSubview(tableView)
        
        tableView.do {
            $0.snp.makeConstraints { (make) in
                make.bottom.left.top.right.equalToSuperview()
            }
        }
    }
    
    func restApi() {
        apiManager.getFeedResults(urlString: AppUrl.newGame.url) {[weak self] (results, error) -> (Void) in
            guard let results = results else {
                return
            }
            
            self?.results = results
            self?.models = []
            
            DispatchQueue.main.async {
                
                var firstData = [FeedResults]()
                var secondData = [FeedResults]()
                
                for i in 0...results.count - 1 {
                    if i < results.count / 2 {
                        firstData.append(results[i])
                    } else {
                        secondData.append(results[i])
                    }
                }
            
                self?.models.append(.genreTitle(model: GenreModel(smallLabel: "", GenreLabel: "New Game")))
                
                self?.models.append(.collectionView(model: firstData))
                self?.models.append(.collectionView(model: secondData))
                
                self?.models.append(.genreTitle(model: GenreModel(smallLabel: "Let's try", GenreLabel: "IMDb Top")))
                let highlightView = self?.dataMock.getHighlight()
                self?.models += highlightView ?? []
                
                self?.models.append(.genreTitle(model: GenreModel(smallLabel: "Adventisment", GenreLabel: "Recommended to you")))
                let bannerView  = self?.dataMock.getBanner()
                self?.models += bannerView ?? []
                
                self?.tableView.reloadData()
            }
        }
    }
}


extension NewGameViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch models[section] {
        case .genreTitle: return 1
        case .collectionView: return 1
        case .highlightView: return 1
        case .bannerView: return 1
        case .listView(let models): return models.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch models[indexPath.section] {
        case .genreTitle(let model):
            let cell = tableView.dequeueReusableCell(for: indexPath) as GenreViewCell
            cell.do {
                $0.configure(with: model)
                $0.accessoryType = .disclosureIndicator
            }
            return cell
            
        case .collectionView(let models):
            let cell = tableView.dequeueReusableCell(for: indexPath) as CollectionTableViewCell
            cell.do {
                $0.configureData(with: models)
                $0.delegate = self
            }
            return cell
            
        case .bannerView(let model):
            let cell = tableView.dequeueReusableCell(for: indexPath) as BannerViewTableCell
            cell.configure(with: model)
            return cell
            
        case .highlightView(let models):
            let cell = tableView.dequeueReusableCell(for: indexPath) as HighlighTableViewCell
            cell.do {
                $0.configureData(with: models)
                $0.delegate = self
            }
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch models[indexPath.section] {
        case .genreTitle: return heightOfGenre
        case .collectionView: return heightOfCollection
        case .bannerView: return heightOfBanner
        case .highlightView: return heightOfHighlight
        case .listView: return heightOfList
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch models[indexPath.section] {
        
        case .genreTitle:
            let vc = GenreViewController()
            vc.url = AppUrl.newGame.url
            navigationController?.pushViewController(vc, animated: true)
            
        case .bannerView(let model):
            let vc = AppDetailViewController()
            vc.highlightModel = model
            
            navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
}

extension NewGameViewController: CollectionTableViewCellDelegate {
    
    func didSelectCell(model: FeedResults) {
        let vc = AppDetailViewController()
        vc.do {
            $0.feedModel = model
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
