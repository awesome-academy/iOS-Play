//
//  ActionMovieViewController.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 4/12/21.
//

import UIKit

final class ActionMovieViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    private var models = [FeedResults]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    private let dataMock = DataMock.shared
    
    private var heightOfCell: CGFloat = 200
    
    private let apiManager = APIManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configViews()
        configTableView()
        restApi()
    }
    
    func configViews() {
        view.backgroundColor = .systemPink
    }
    
    func configTableView() {
        tableView.do {
            $0.delegate = self
            $0.dataSource = self
            $0.showsVerticalScrollIndicator = false
            $0.showsHorizontalScrollIndicator = false
            $0.separatorStyle = .none
            $0.register(cellType: ListMovieTableViewCell.self)
        }
    }
    
    func restApi() {
        apiManager.getFeedResults(urlString: MovieUrl.action.url) { [weak self] (results, error) -> (Void) in
            guard let results = results else {
                return
            }
            DispatchQueue.main.async {
                self?.models = results
            }
        }
    }
}

extension ActionMovieViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as ListMovieTableViewCell
        let model = models[indexPath.row]
        cell.configure(model: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = MovieDetailViewController()
        vc.backgroundImage = Asset.marvel.image
        vc.model = models[indexPath.row]
        vc.info = InfoCellModel(infomation: "", firstKind: "Action", secondKind: "Horror")
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        heightOfCell = view.frame.size.width / 2 * 1.2 + 20
        return heightOfCell
    }
}
