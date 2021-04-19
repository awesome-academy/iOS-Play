

import UIKit

final class HotTrackViewController: UIViewController {

    @IBOutlet weak private var tableView: UITableView!
    
    private var models = [MusicCellMode]()
    
    private let dataMock = DataMock.shared
    
    private let heightofGenre: CGFloat = 30
    private let heightofCollection: CGFloat = 280
    private let heightofFeature: CGFloat = 110
    private let heightofBanner: CGFloat = 310
    
    private let apiManger = APIManager.shared
    
    private var results = [FeedResults]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configViews()
        configTableView()
        
        //getDataMock()
        
        restApi()
    }
    
    func configViews() {
        view.backgroundColor = .white
    }
    
    func configTableView() {
        tableView.do {
            $0.delegate = self
            $0.dataSource = self
            $0.register(cellType: GenreViewCell.self)
            $0.register(cellType: HotTrackTableViewCell.self)
            $0.register(cellType: FeatureTableViewCell.self)
            $0.register(cellType: BannerViewTableCell.self)
            $0.separatorStyle = .none
        }
    }
    
    func getDataMock() {
        models += dataMock.getGenre(smallText: "hot", genre: "What do people listen")
        models += dataMock.getMusicCollecion()
        models += dataMock.getGenre(smallText: "", genre: "Apple Music")
        models += dataMock.getMusicFeature()
        models += dataMock.getGenre(smallText: "#1", genre: "Top Showbiz")
        models += dataMock.getMusicBaner()
        models += dataMock.getGenre(smallText: "Vbiz", genre: "BXH")
        models += dataMock.getMusicCollecion()
        models += dataMock.getGenre(smallText: "", genre: "Apple Music")
        models += dataMock.getMusicFeature()
    }
    
    func restApi() {
        apiManger.getFeedResults(urlString: MusicUrl.hotTrack.url) { [weak self] (results, error) -> (Void) in
            guard let results = results else {
                print("fail")
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
            
                self?.models += self?.dataMock.getGenre(smallText: "hot", genre: "What do people listen") ?? []
                self?.models.append(.collectionView(model: firstData))
                self?.models += self?.dataMock.getGenre(smallText: "", genre: "Apple Music") ?? []
                self?.models += self?.dataMock.getMusicFeature() ?? []
                self?.models += self?.dataMock.getGenre(smallText: "#1", genre: "Top Showbiz") ?? []
                self?.models += self?.dataMock.getMusicBaner() ?? []
                self?.models += self?.dataMock.getGenre(smallText: "Vbiz", genre: "BXH") ?? []
                self?.models.append(.collectionView(model: secondData))
                self?.models += self?.dataMock.getGenre(smallText: "", genre: "Apple Music") ?? []
                self?.models += self?.dataMock.getMusicFeature() ?? []
                self?.tableView.reloadData()
            }
        }
    }
}

//MARK: - TableView Delegate, DataSource
extension HotTrackViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch models[section] {
        case .genreTitle: return 1
        case .collectionView: return 1
        case .featureView: return 1
        case .bannerView: return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch models[indexPath.section] {
        case .genreTitle(let model):
            let cell = tableView.dequeueReusableCell(for: indexPath) as GenreViewCell
            cell.configure(with: model)
            return cell
            
        case .collectionView(let models):
            let cell = tableView.dequeueReusableCell(for: indexPath) as HotTrackTableViewCell
            cell.configure(with: models)
            cell.delegate = self
            return cell
            
        case .featureView(let models):
            let cell = tableView.dequeueReusableCell(for: indexPath) as FeatureTableViewCell
            cell.configure(with: models)
            return cell
            
        case .bannerView(let model):
            let cell = tableView.dequeueReusableCell(for: indexPath) as BannerViewTableCell
            cell.configure(with: model)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch models[indexPath.section] {
        case .genreTitle: return heightofGenre
        case .collectionView: return heightofCollection
        case .featureView: return heightofFeature
        case .bannerView: return heightofBanner
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch models[indexPath.section] {
        case .genreTitle:
            let vc = GenreViewController()
            vc.url = MusicUrl.hotTrack.url
            navigationController?.pushViewController(vc, animated: true)
            
        default:
            break
        }
    }
}

extension HotTrackViewController: CollectionTableViewCellDelegate {

    func didSelectCell(model: FeedResults) {
        let vc = MovieDetailViewController()
        vc.do {
            $0.model = model
            $0.feedType = "About this music"
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
