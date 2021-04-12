//
//  TopAppViewController.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 4/10/21.
//

import UIKit

final class TopAppViewController: UIViewController {
    
    @IBOutlet weak private var tableView: UITableView!

    private var models: [FeedResults] = []
    private let dataMock = DataMock.shared
    
    private let heightOfRank: CGFloat = 120
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configViews()
        getDataMock()
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
        cell.configure(with: model,
                       rank: "\(indexPath.row + 1)")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightOfRank
    }
}
