//
//  BookViewController.swift
//  iOS-Play
//
//  Created by Quang Nguyen on 3/31/21.
//

import UIKit

final class BookViewController: UIViewController {

    @IBOutlet private weak var segmentCollection: UICollectionView!
    
    private let segmentItems = FeedType.books.item
    
    private var itemPicked: [Bool] = {
        var item = [Bool](repeating: false, count: FeedType.books.item.count)
        item[0] = true
        return item
    }()
    
    private let searchBar = UISearchBar()
    
    private var childView = [UIViewController]()
    
    private let pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil).then {
        $0.view.backgroundColor = .white
    }
    
    private var currentPageIndex : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configSegment()
        congigSearchBar()
        
        configChildView()
        configPageView()
    }
    
    func configSegment() {
        view.backgroundColor = .white
        
        segmentCollection.do {
            $0.delegate = self
            $0.dataSource = self
            $0.showsVerticalScrollIndicator = false
            $0.showsHorizontalScrollIndicator = false
            $0.backgroundColor = .white
            $0.register(cellType: SegmentCollectionViewCell.self)
            let layout = UICollectionViewFlowLayout().then {
                $0.scrollDirection = .horizontal
                $0.itemSize = CGSize(width: view.frame.size.width / 2, height: 40)
                $0.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                $0.minimumLineSpacing = 0
                $0.minimumInteritemSpacing = 0
            }
            $0.collectionViewLayout = layout
        }
    }
    
    func congigSearchBar() {
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
    
    func configChildView() {
        let freeVC = TopFreeViewController()
        let paidVC = TopPaidViewController()
        
        freeVC.view.tag = 0
        paidVC.view.tag = 0
        
        childView = [
            freeVC,
            paidVC,
        ]
    }
    
    func configPageView() {
        pageController.delegate = self
        pageController.dataSource = self
        
        view.addSubview(segmentCollection)
        view.addSubview(pageController.view)
        
        segmentCollection.do {
            $0.snp.makeConstraints { (make) in
                make.top.left.right.equalToSuperview()
                make.height.equalTo(40)
            }
        }
        
        pageController.do {
            
            $0.setViewControllers([childView[currentPageIndex]],
                                  direction: .forward, animated: true, completion: nil)
            
            $0.view.snp.makeConstraints { (make) in
                make.top.equalTo(segmentCollection.snp.bottom).offset(0)
                make.left.bottom.right.equalToSuperview()
            }
            
            $0.didMove(toParent: self)
        }
        addChild(pageController)
        
        //remove swipeGesture
        for view in self.pageController.view.subviews {
            if let subView = view as? UIScrollView {
                subView.isScrollEnabled = false
            }
        }
    }
}

extension BookViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return segmentItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath) as SegmentCollectionViewCell
        cell.configure(feedType: segmentItems[indexPath.row], color: UIColor.white, picked: itemPicked[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let itempick = [Bool](repeating: false, count: FeedType.apps.item.count + 1)
        self.itemPicked = itempick
        self.itemPicked[indexPath.row] = true
        
        collectionView.reloadData()
        
        //push view controller
        let nextIndex = indexPath.row
        let direction: UIPageViewController.NavigationDirection = nextIndex < currentPageIndex
            ? .reverse
            : .forward
        pageController.setViewControllers([childView[nextIndex]], direction: direction, animated: true, completion: nil)
        currentPageIndex = nextIndex
    }
}

extension BookViewController: UISearchBarDelegate {
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

extension BookViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        currentPageIndex = viewController.view.tag
        let beforeIndex = viewController.view.tag - 1
        if beforeIndex < 0 { return nil }
        return childView[beforeIndex]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        currentPageIndex = viewController.view.tag
        let afterIndex = viewController.view.tag + 1
        if afterIndex > childView.count - 1 { return nil }
        return childView[afterIndex]
    }
}
