//
//  TopAppViewController.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 4/10/21.
//

import UIKit

final class TopAppViewController: UIViewController {
    
    @IBOutlet weak private var tableView: UITableView!

    private var models = [FeedResults]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    private let dataMock = DataMock.shared
    
    private let heightOfRank: CGFloat = 120
    
    private let apiManager = APIManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configViews()
        //getDataMock()
        
        restApi()
    }
    
    func configViews() {
        tableView.do {
            $0.delegate = self
            $0.dataSource = self
            $0.register(cellType: RankTableViewCell.self)
            $0.separatorStyle = .none
        }
    }
    
    func getDataMock() {
        models += dataMock.getFeedResults()
    }
    
    func restApi() {
        apiManager.getFeedResults(urlString: AppUrl.topFree.url) { [weak self] (results, error) -> (Void) in
            guard let results = results else {
                return
            }
            
            self?.models = results
        }
    }
}

extension TopAppViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as RankTableViewCell
        let model = models[indexPath.row]
        
        apiManager.getImage(results: model) { (data, error) -> (Void) in
            var image = Asset.music0.image
            if let data = data {
                image = UIImage(data: data) ?? Asset.music0.image
            }
            
            DispatchQueue.main.async {
                cell.configure(with: model,
                               rank: "\(indexPath.row + 1)",
                               image: image)
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = AppDetailViewController().then {
            $0.feedModel = models[indexPath.row]
            $0.backgroundImage = Asset.tiktok.image
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightOfRank
    }
}
