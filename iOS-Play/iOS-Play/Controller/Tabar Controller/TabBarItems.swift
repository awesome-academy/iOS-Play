//
//  TabBarItems.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 3/31/21.
//

import Foundation
import UIKit


enum TabbarItem {
    
    case apps
    case musics
    case movies
    case books
    case tvShows
    
    var item: UITabBarItem {
        switch self {
        case .apps:
            return UITabBarItem(title: "Apps", image: Asset.app.image, selectedImage: Asset.apptapped.image.withRenderingMode(.alwaysOriginal))
        case .musics:
            return UITabBarItem(title: "Musics", image: Asset.music.image, selectedImage: Asset.musictapped.image.withRenderingMode(.alwaysOriginal))
        case .movies:
            return UITabBarItem(title: "Movies", image: Asset.movie.image, selectedImage: Asset.movietapped.image.withRenderingMode(.alwaysOriginal))
        case .books:
            return UITabBarItem(title: "Books", image: Asset.book.image, selectedImage: Asset.booktapped.image.withRenderingMode(.alwaysOriginal))
        case .tvShows:
            return UITabBarItem(title: "TV Shows", image: Asset.tvShow.image, selectedImage: Asset.tvShowtapped.image.withRenderingMode(.alwaysOriginal))
        }
    }
}
