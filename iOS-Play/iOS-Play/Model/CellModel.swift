//
//  CellModel.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 4/2/21.
//

import Foundation
import UIKit

enum TVShowCellModel {
    case genreTitle(model: GenreModel)
    case AppleTVView(model: [FeedResults])
    case highlightView(model: [HighlightTableCellModel])
}

enum BookCellModel {
    case genreTitle(model: GenreModel)
    case collectionView(model: [FeedResults])
}

enum MusicCellMode {
    case genreTitle(model: GenreModel)
    case collectionView(model : [FeedResults])
    case featureView(mode: [Features])
    case bannerView(model: HighlightTableCellModel)
}

enum CellModel {
    case genreTitle (model: GenreModel)
    case collectionView(model: [FeedResults])
    case highlightView(model: [HighlightTableCellModel])
    case bannerView(model: HighlightTableCellModel)
    case listView(model: [ListTableCellModel])
}

struct ImageResults {
    let image: UIImage
}

struct GenreModel {
    let smallLabel: String
    let GenreLabel: String
}

struct ListTableCellModel {
    let title: String
}

struct CollectionTableCellModel {
    let title: String
    let image: UIImage
    let appName: String
    let authorName: String
    let release: String
}

struct HighlightTableCellModel {
    let artistName : String
    let id : String
    let releaseDate : String
    let name : String
    let copyright : String
    let artistUrl : String
    let artworkUrl100: String
    let image: UIImage
    let highlightImage: UIImage
}

struct BannerTableCellModel {
    let artistName: String
    let id: String
    let releaseDate: String
    let name: String
    let copyright: String
    let artistUrl: String
    let artworkUrl100: String
    let image : UIImage
    let bannerImage: UIImage
}

enum HeightofCell {
    case genre
    case collection
    case highlight
    case banner
}

struct Features {
    let feature: String
}

