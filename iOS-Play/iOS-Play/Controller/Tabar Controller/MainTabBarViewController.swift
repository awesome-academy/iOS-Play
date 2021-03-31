//
//  MainTabBarViewController.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 3/31/21.
//

import Foundation
import UIKit

class MainTabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().tintColor = .darkGray
        tabBar.barTintColor = UIColor.white
        tabBar.clipsToBounds = true
        
        setUpViewController()
        
    }
    
    func setUpViewController() {
        viewControllers = [
            generateNavigationController(vc: AppViewController(), title: "Apps", image: "app", imagetap: "apptapped"),
            generateNavigationController(vc: MusicViewController(), title: "Musics", image: "music", imagetap: "musictapped"),
            generateNavigationController(vc: MovieViewController(), title: "Movies", image: "movie", imagetap: "movietapped"),
            generateNavigationController(vc: BookViewController(), title: "Books", image: "book", imagetap: "booktapped"),
            generateNavigationController(vc: TVShowViewController(), title: "TV Shows", image: "tvShow", imagetap: "tvShowtapped")
        ]
    }
    
    func generateNavigationController(vc: UIViewController,title: String, image: String, imagetap: String ) -> UINavigationController {
        
        let navController = BaseNaviController(rootViewController: vc)
        navController.navigationBar.backgroundColor = .red
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: image)
        navController.tabBarItem.selectedImage = UIImage(named: imagetap)?.withRenderingMode(.alwaysOriginal)
        navController.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.darkGray], for: .disabled)
        
        return navController
    }
}
