//
//  DetailCellModel.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 4/8/21.
//

import Foundation
import UIKit

enum TVDetailCellModel {
    case imageBackground(model: FeedResults)
    case descriptionView(model: [DescriptionCollectionCellModel])
    case infoView(model: InfoCellModel)
    case commentView(model: [CommentCellModel])
}

enum MovieDetailCellModel {
    case imageBackground(model: ImageBackgourndCellModel)
    case overView(model: OverViewTableCellModel)
    case descriptionView(model: [DescriptionCollectionCellModel])
    case infoView(model: InfoCellModel)
    case commentView(model: [CommentCellModel])
}

enum DetailCellModel {
    case overView(model: OverViewTableCellModel)
    case descriptionView(model: [DescriptionCollectionCellModel])
    case downloadView(model: DownloadTableCellModel)
    case commentView(model: [CommentCellModel])
}

struct ImageBackgourndCellModel {
    let image: UIImage
}

struct InfoCellModel {
    let infomation: String
    let firstKind: String
    let secondKind: String
}

struct OverViewTableCellModel {
    let artistName: String
    let id: String
    let releaseDate: String
    let name: String
    let copyright: String
    let artistUrl: String
    let artworkUrl100: String
}

struct DescriptionCollectionCellModel {
    let aboveString: String
    let belowString: String
}

struct DownloadTableCellModel {
    let appImage: UIImage
}

struct CommentCellModel {
    let userImage: UIImage
    let commentString: String
}
