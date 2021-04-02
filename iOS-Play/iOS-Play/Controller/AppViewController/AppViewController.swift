//
//  AppViewController.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 3/31/21.
//

import Foundation
import UIKit

class AppViewController: UIViewController {
    
    private let searchBar = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configViews()
        configSearchBar()
    }
    
    func configViews() {
        view.backgroundColor = .systemPink
    }
    
    func configSearchBar() {
        let witdh = view.bounds.width - 30 - 10 - 10 - 10
        let frame = CGRect(x: 0, y: 0, width: witdh, height: 44)
        let titleBar = UIView(frame: frame)
        searchBar.frame = frame
        
        searchBar.delegate = self
        titleBar.addSubview(searchBar)
        
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: witdh + 60, height: 44))
        titleView.addSubview(titleBar)
        
        navigationItem.titleView = titleView
    }
}

extension AppViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
        
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
    
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
   
        searchBar.showsCancelButton = false
        //hide keyboard when tapped cancel
        searchBar.endEditing(true)
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
   
        searchBar.showsCancelButton = false
        searchBar.endEditing(true)
    }
}
