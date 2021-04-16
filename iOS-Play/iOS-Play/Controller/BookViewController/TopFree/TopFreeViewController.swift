//
//  TopFreeViewController.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 4/14/21.
//

import UIKit

final class TopFreeViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var models = [BookCellModel]()
    
    private let dataMock = DataMock.shared
    
    private let apiManger = APIManager.shared
    
    private var results = [FeedResults]()
    
    private let heightofGenre: CGFloat = 30
    private let heightofCollection: CGFloat = 280
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        configTableView()
        restApi()
    }
    
    func configView() {
        view.backgroundColor = .yellow
    }
    
    func configTableView() {
        tableView.do {
            $0.delegate = self
            $0.dataSource = self
            $0.register(cellType: GenreViewCell.self)
            $0.register(cellType: HotTrackTableViewCell.self)
            $0.showsVerticalScrollIndicator = false
            $0.showsHorizontalScrollIndicator = false
            $0.separatorStyle = .none
        }
    }
    
    func restApi() {
        apiManger.getFeedResults(urlString: BookUrl.topFree.url) { [weak self] (results, error) -> (Void) in
            guard let results = results else {
                return
            }
            
            self?.results = results
            self?.models = []
            
            DispatchQueue.main.async {
                var firstData = [FeedResults]()
                var secondData = [FeedResults]()
                var thirdData = [FeedResults]()
                
                for i in 0...results.count - 1 {
                    if i < results.count / 3 {
                        firstData.append(results[i])
                    } else if i < results.count / 3 * 2 {
                        secondData.append(results[i])
                    } else if i >= results.count / 3 * 2 {
                        thirdData.append(results[i])
                    }
                }
                
                self?.models += self?.dataMock.getGenre(smallText: "", genre: "New Books") ?? []
                self?.models.append(.collectionView(model: firstData))
                self?.models += self?.dataMock.getGenre(smallText: "hot", genre: "Best Sale") ?? []
                self?.models.append(.collectionView(model: secondData))
                self?.models += self?.dataMock.getGenre(smallText: "adventistment", genre: "Recommended to you") ?? []
                self?.models.append(.collectionView(model: thirdData))
                self?.tableView.reloadData()
            }
        }
    }
}

extension TopFreeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch models[section] {
        case .genreTitle: return 1
        case .collectionView: return 1
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
            let cell = tableView.dequeueReusableCell(for: indexPath) as HotTrackTableViewCell
            cell.configure(with: models)
            cell.setImageCornerRadius(with: 2)
            cell.delegate = self
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch models[indexPath.section] {
        case .genreTitle: return heightofGenre
        case .collectionView: return heightofCollection * 2
        }
    }
}

extension TopFreeViewController: CollectionTableViewCellDelegate {
    
    func didSelectCell(model: FeedResults) {
        let vc = MovieDetailViewController()
        let image = UIImageView()
        image.setImage(urlString: model.artworkUrl100)
        vc.do {
            $0.model = model
            $0.backgroundImage = image.image ?? Asset.ctcht.image
            $0.info = InfoCellModel(infomation: "", firstKind: "detective", secondKind: "romantic")
            $0.feedType = "About this book"
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}
