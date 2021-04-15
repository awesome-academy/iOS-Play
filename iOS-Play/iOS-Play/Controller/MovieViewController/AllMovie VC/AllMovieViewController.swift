//
//  AllMovieViewController.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 4/12/21.
//

import UIKit

final class AllMovieViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configViews()
    }
    
    func configViews() {
        view.backgroundColor = .yellow
    }
}
