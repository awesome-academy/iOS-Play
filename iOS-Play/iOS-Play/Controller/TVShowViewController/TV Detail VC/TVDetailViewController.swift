//
//  TVDetailViewController.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 4/16/21.
//

import UIKit

final class TVDetailViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var backButton: UIButton!
    
    private var models = [TVDetailCellModel]()
    
    private let apiManager = APIManager.shared
    
    private let dataMock = DataMock.shared
    
    var model: FeedResults?
    
    var feedType = "About this TVShow"
    
    private var heightOfBackgroundView: CGFloat = 200
    private let heightOfDescriptionView: CGFloat = 100
    private let heightOfInfoView: CGFloat = 300
    private let heightOfCommentView: CGFloat = 120
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        configNavigationBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        configTableView()
        passData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        navigationItem.setRightBarButton(nil, animated: true)
    }
    
    deinit {
        print("TV Detail ViewController deinit")
    }
    
    func configView() {
        view.backgroundColor = .black

        heightOfBackgroundView = view.frame.size.height - 80
        
        backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
    }
    
    func configNavigationBar() {
            
        let titleBar = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 44))
        let image = UIImageView().then {
            $0.setImage(urlString: model?.artworkUrl100 ?? "")
            $0.layer.cornerRadius = 7
            $0.clipsToBounds = true
            $0.contentMode = .scaleAspectFill
            $0.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        }
        titleBar.addSubview(image)
        image.snp.makeConstraints { (make) in
            make.width.height.equalTo(35)
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        navigationItem.titleView = titleBar
        
        let downloadButton = UIButton().then {
            $0.setTitle("Download", for: .normal)
            $0.titleLabel?.font = FontFamily.Arvo.regular.font(size: 14)
            $0.setTitleColor(UIColor.white, for: .normal)
            $0.layer.cornerRadius = 34 / 2
            $0.backgroundColor = .systemPink
            $0.frame = CGRect(x: 0, y: 0, width: 90, height: 34)
            $0.addTarget(self, action: #selector(downloadTap), for: .touchUpInside)
        }
        let rightBarView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 34))
        rightBarView.addSubview(downloadButton)
        rightBarView.bounds = rightBarView.bounds.offsetBy(dx: -20, dy: 0)
        let rightbarButton = UIBarButtonItem(customView: rightBarView)
        self.navigationItem.rightBarButtonItem = rightbarButton
    }
    
    func configTableView() {
        tableView.do {
            $0.delegate = self
            $0.dataSource = self
            $0.backgroundColor = .white
            $0.showsVerticalScrollIndicator = false
            $0.showsHorizontalScrollIndicator = false
            $0.separatorStyle = .none
            
            $0.register(cellType: TVShowTableViewCell.self)
            $0.register(cellType: DescriptionTableViewCell.self)
            $0.register(cellType: InfoTableViewCell.self)
            $0.register(cellType: CommentTableCell.self)
        }
    }
    
    func passData() {
        if let model = model {
            models.append(.imageBackground(model: model))
        }
        
        models += dataMock.getDescriptionView()
        models.append(.infoView(model: InfoCellModel(infomation: "", firstKind: "Science", secondKind: "Action")))
        models += dataMock.getCommmentView()
        
        tableView.reloadData()
    }
    
    @objc func downloadTap() {
        let vc = DownloadViewController()
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func back() {
        navigationController?.popViewController(animated: true)
    }
}

extension TVDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch models[section] {
        case .imageBackground: return 1
        case .descriptionView: return 1
        case .infoView: return 1
        case .commentView(let models): return models.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch models[indexPath.section] {
        case .imageBackground(let model):
            let cell = tableView.dequeueReusableCell(for: indexPath) as TVShowTableViewCell
            
            cell.do { [weak self] in
                $0.configure(model: model)
                $0.download = {
                    let vc = DownloadViewController()
                    vc.modalPresentationStyle = .fullScreen
                    self?.present(vc, animated: true, completion: nil)
                }
            }
            return cell
            
        case .descriptionView(let models):
            let cell = tableView.dequeueReusableCell(for: indexPath) as DescriptionTableViewCell
            cell.configure(with: models)
            return cell
            
        case .infoView(let model):
            let cell = tableView.dequeueReusableCell(for: indexPath) as InfoTableViewCell
            cell.do { [weak self] in
                $0.configure(model: model, feedtype: feedType)
                $0.buttonTapped = { 
                    let vc = DownloadViewController()
                    self?.present(vc, animated: true, completion: nil)
                }
            }
            return cell
            
        case .commentView(let models):
            let cell = tableView.dequeueReusableCell(for: indexPath) as CommentTableCell
            cell.configure(with: models[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch models[indexPath.section] {
        case .imageBackground: return heightOfBackgroundView
        case .descriptionView: return heightOfDescriptionView
        case .infoView: return heightOfInfoView
        case .commentView: return heightOfCommentView
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension TVDetailViewController: UIScrollViewDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > heightOfBackgroundView - 200 {
            navigationController?.navigationBar.isHidden = false
            
        } else {
            navigationController?.navigationBar.isHidden = true
        }
    }
}
