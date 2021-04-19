//
//  GenreViewController.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 4/17/21.
//

import UIKit

final class GenreViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    var url: String?
    
    private var models = [FeedResults]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    private let apiManager = APIManager.shared
    
    private let heightOfCell: CGFloat = 110
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTableView()
        restApi()
    }
    
    func configTableView() {
        tableView.do {
            $0.delegate = self
            $0.dataSource = self
            $0.showsVerticalScrollIndicator = false
            $0.showsHorizontalScrollIndicator = false
            $0.separatorStyle = .none
            
            $0.register(cellType: GenreTableViewCell.self)
        }
    }
    
    func restApi() {
        apiManager.getFeedResults(urlString: url ?? "") { [weak self] (results, error) -> (Void) in
            guard let results = results else {
                return
            }
            
            DispatchQueue.main.async {
                self?.models = results
            }
        }
    }
}

extension GenreViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as GenreTableViewCell
        cell.configure(model: models[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = TVDetailViewController()
        vc.model = models[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightOfCell
    }
}

