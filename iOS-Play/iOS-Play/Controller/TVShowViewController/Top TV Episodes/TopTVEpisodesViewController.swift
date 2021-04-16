//
//  TopTVEpisodesViewController.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 4/15/21.
//

import UIKit

final class TopTVEpisodesViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var models = [TVShowCellModel]()
        
    private let heightOfGenre: CGFloat = 40
    private var heightOfAppleTVView: CGFloat = 700
    private let heightOfHighlightView: CGFloat = 300
    
    private let apiManager = APIManager.shared
    
    private let dataMock = DataMock.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configView()
        configTableView()
        restApi()
    }
    
    func configView() {
        view.backgroundColor = .white
        heightOfAppleTVView = view.frame.size.height - 40 - 80 - 100
    }
    
    func configTableView() {
        tableView.do {
            $0.delegate = self
            $0.dataSource = self
            $0.showsVerticalScrollIndicator = false
            $0.showsHorizontalScrollIndicator = false
            $0.separatorStyle = .none
            $0.register(cellType: GenreViewCell.self)
            $0.register(cellType: AppleTVTableViewCell.self)
            $0.register(cellType: HighlighTableViewCell.self)
        }
    }
    
    func restApi() {
        apiManager.getFeedResults(urlString: TVShowUrl.topEpisodes.url) { [weak self] (results, error) -> (Void) in
            guard let results = results else {
                return
            }
            
            DispatchQueue.main.async {
                self?.models.append(.AppleTVView(model: results))
                
                var firstData = [HighlightTableCellModel]()
                var secondData = [HighlightTableCellModel]()
                
                for i in 0...results.count - 1 {
                    let result = results[i]
                    
                    if i < results.count / 2 {
                        firstData.append(HighlightTableCellModel(artistName: result.artistName ?? "", id: "", releaseDate: result.releaseDate ?? "", name: result.name ?? "", copyright: result.copyright ?? "", artistUrl: "", artworkUrl100: result.artworkUrl100 ?? "", image: UIImage(), highlightImage: UIImage()))
                    } else {
                        secondData.append(HighlightTableCellModel(artistName: result.artistName ?? "", id: "", releaseDate: result.releaseDate ?? "", name: result.name ?? "", copyright: result.copyright ?? "", artistUrl: "", artworkUrl100: result.artworkUrl100 ?? "", image: UIImage(), highlightImage: UIImage()))
                    }
                }
                self?.models.append(.genreTitle(model: GenreModel(smallLabel: "", GenreLabel: "Hot")))
                self?.models.append(.highlightView(model: firstData))
                self?.models.append(.genreTitle(model: GenreModel(smallLabel: "", GenreLabel: "Watch Now")))
                self?.models.append(.highlightView(model: secondData))
                self?.tableView.reloadData()
            }
        }
    }
}

extension TopTVEpisodesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch models[section] {
        case .genreTitle: return 1
        case .AppleTVView: return 1
        case .highlightView: return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch models[indexPath.section] {
        case .genreTitle(let model):
            let cell = tableView.dequeueReusableCell(for: indexPath) as GenreViewCell
            cell.configure(with: model)
            cell.accessoryType = .disclosureIndicator
            return cell
            
        case .AppleTVView(let models):
            let cell = tableView.dequeueReusableCell(for: indexPath) as AppleTVTableViewCell
            cell.backgroundColor = UIColor(white: 1, alpha: 0)
            cell.configure(models: models)
            cell.delegate = self
            return cell
            
        case .highlightView(let models):
            let cell = tableView.dequeueReusableCell(for: indexPath) as HighlighTableViewCell
            cell.configureData(with: models)
            cell.delegate = self
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch models[indexPath.section] {
        case .genreTitle: return heightOfGenre
        case .AppleTVView: return heightOfAppleTVView
        case .highlightView: return heightOfHighlightView
        }
    }
}

extension TopTVEpisodesViewController: CollectionTableViewCellDelegate {
    
    func didSelectCell(model: FeedResults) {
    }
}
