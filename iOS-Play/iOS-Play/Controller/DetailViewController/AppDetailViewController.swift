//
//  AppDetailViewController.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 4/5/21.
//

import Foundation
import UIKit

final class AppDetailViewController: UIViewController {
    @IBOutlet weak private var tableView: UITableView!

    
    private var models: [DetailCellModel] = []
    var highlightModel: HighlightTableCellModel?
    var feedModel: FeedResults?
    private var data: FeedResults?

    var image: UIImage = Asset.loll.image
    var backgroundImage: UIImage = Asset.loLbanner.image
    
    private let dataMock = DataMock.shared
    
    private let overViewHeight: CGFloat = 130
    private let desciptionHeight: CGFloat = 100
    private let downloadHeight: CGFloat = 570
    private let commentHeight: CGFloat = 120
    
    private let apiManager = APIManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configViews()
        passData()
        getDataMock()
    }
    
    func configViews() {
        view.backgroundColor = .systemPink
        
        tableView.do {
            $0.delegate = self
            $0.dataSource = self
            $0.register(cellType: OverViewTableViewCell.self)
            $0.register(cellType: DescriptionTableViewCell.self)
            $0.register(cellType: DownloadTableViewCell.self)
            $0.register(cellType: CommentTableCell.self)
            $0.showsVerticalScrollIndicator = false
            $0.showsHorizontalScrollIndicator = false
            $0.separatorColor = .clear
        }
    }
    
    func getDataMock(){
        models += dataMock.getDescriptionView()
        models += dataMock.getDownloadView()
        models += dataMock.getCommmentView()
    }
    
    func passData(){
        if let model = highlightModel {
            models.append(.overView(model: OverViewTableCellModel(artistName: model.artistName, id: "", releaseDate: model.releaseDate, name: model.name, copyright: model.copyright, artistUrl: model.artistUrl, artworkUrl100: model.artworkUrl100)))
            image = model.image
        } else if let model = feedModel {
            models.append(.overView(model: OverViewTableCellModel(artistName: model.artistName, id: "", releaseDate: model.releaseDate, name: model.name, copyright: model.copyright, artistUrl: model.artistUrl, artworkUrl100: model.artworkUrl100)))
        }
    }
}

extension AppDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch models[section]{
        case .overView: return 1
        case .descriptionView: return 1
        case .downloadView: return 1
        case .commentView(let models): return models.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {    
        switch models[indexPath.section] {
        case .overView(let model):
            let cell = tableView.dequeueReusableCell(for: indexPath) as OverViewTableViewCell
            
            if model.artworkUrl100.isEmpty {
                cell.configure(with: model, image : image)
            } else {
                apiManager.getArtwork(urlString: model.artworkUrl100) { (data, error) -> (Void) in
                    var image = UIImage()
                    if let data = data {
                        image = UIImage(data: data) ?? Asset.backWhite.image
                    }

                    DispatchQueue.main.async {
                        cell.configure(with: model, image: image)
                    }
                }
            }
            
            return cell
            
        case .descriptionView(let models):
            let cell = tableView.dequeueReusableCell(for: indexPath) as DescriptionTableViewCell
            cell.do {
                $0.configure(with: models)
            }
            return cell
            
        case .downloadView:
            let cell = tableView.dequeueReusableCell(for: indexPath) as DownloadTableViewCell
            cell.configure(with: backgroundImage)
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
        case .overView: return overViewHeight
        case .descriptionView: return desciptionHeight
        case .downloadView: return downloadHeight
        case .commentView: return commentHeight
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
