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
            return UITabBarItem(title: "Apps", image: UIImage(named: "app"), selectedImage: UIImage(named: "apptapped")?.withRenderingMode(.alwaysOriginal))
        case .musics:
            return UITabBarItem(title: "Musics", image: UIImage(named: "music"), selectedImage: UIImage(named: "musictapped")?.withRenderingMode(.alwaysOriginal))
        case .movies:
            return UITabBarItem(title: "Movies", image: UIImage(named: "movie"), selectedImage: UIImage(named: "movietapped")?.withRenderingMode(.alwaysOriginal))
        case .books:
            return UITabBarItem(title: "Books", image: UIImage(named: "book"), selectedImage: UIImage(named: "booktapped")?.withRenderingMode(.alwaysOriginal))
        case .tvShows:
            return UITabBarItem(title: "TV Shows", image: UIImage(named: "tvShow"), selectedImage: UIImage(named: "tvShowtapped")?.withRenderingMode(.alwaysOriginal))
        }
    }
}
