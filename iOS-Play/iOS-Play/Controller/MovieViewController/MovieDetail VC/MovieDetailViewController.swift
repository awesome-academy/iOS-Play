//
//  MovieDeatilViewController.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 4/13/21.
//

import UIKit

final class MovieDetailViewController: UIViewController {

    @IBOutlet weak private var tableView: UITableView!
    
    var models = [MovieDetailCellModel]()
    
    private let dataMock = DataMock.shared
    
    var model: FeedResults?
    
    private let results = [FeedResults]()
    
    var backgroundImage = Asset.ctcht.image
    
    var info: InfoCellModel?
    
    private let backgroundHeight: CGFloat = 200
    private let overViewHeight: CGFloat = 130
    private let desciptionHeight: CGFloat = 100
    private let infoHeight: CGFloat = 300
    private let commentHeight: CGFloat = 120
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTableView()
        
        getDataMock()
    }
    
    func configTableView() {
        tableView.do {
            $0.delegate = self
            $0.dataSource = self
            $0.showsVerticalScrollIndicator = false
            $0.showsHorizontalScrollIndicator = false
            $0.separatorStyle = .none
            $0.register(cellType: ImageBackgroundTableViewCell.self)
            $0.register(cellType: OverViewTableViewCell.self)
            $0.register(cellType: DescriptionTableViewCell.self)
            $0.register(cellType: InfoTableViewCell.self)
            $0.register(cellType: CommentTableCell.self)
        }
    }
    
    func getDataMock() {
        guard let model = model else {
            return
        }
        
        models += dataMock.getImageBackground(image: backgroundImage)
        models.append(.overView(model: OverViewTableCellModel(artistName: model.artistName ?? "", id: "", releaseDate: model.releaseDate ?? "", name: model.name ?? "", copyright: model.copyright ?? "", artistUrl: model.artistUrl ?? "", artworkUrl100: model.artworkUrl100 ?? "")))
        models += dataMock.getDescriptionView()
        
        if let info = info {
            models.append(.infoView(model: info))
        } else {
            models += dataMock.getInfoView()
        }
        models += dataMock.getCommmentView()
        tableView.reloadData()
    }
}

extension MovieDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch models[section] {
        case .imageBackground: return 1
        case .overView: return 1
        case .descriptionView: return 1
        case .infoView: return 1
        case .commentView(let models): return models.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch models[indexPath.section] {
        case .imageBackground(let model):
            let cell = tableView.dequeueReusableCell(for: indexPath) as ImageBackgroundTableViewCell
            cell.configure(model: model)
            return cell
        case .overView(let model):
            let cell = tableView.dequeueReusableCell(for: indexPath) as OverViewTableViewCell
            cell.configure(with: model)
            return cell
        case .descriptionView(let models):
            let cell = tableView.dequeueReusableCell(for: indexPath) as DescriptionTableViewCell
            cell.configure(with: models)
            return cell
        case .infoView(let model):
            let cell = tableView.dequeueReusableCell(for: indexPath) as InfoTableViewCell
            cell.configure(model: model)
            return cell
        case .commentView(let models):
            let model = models[indexPath.row]
            let cell = tableView.dequeueReusableCell(for: indexPath) as CommentTableCell
            cell.configure(with: model)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch models[indexPath.section]{
        case .imageBackground: return backgroundHeight
        case .overView: return overViewHeight
        case .descriptionView: return desciptionHeight
        case .infoView: return infoHeight
        case .commentView: return commentHeight
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
