//
//  SwipeController.swift
//  OnboardingFlow
//
//  Created by Mark Kim on 4/9/20.
//  Copyright © 2020 Mark Kim. All rights reserved.
//

import UIKit

class SwipeController: UIViewController, UICollectionViewDelegateFlowLayout {
    
    var collectionView : UICollectionView!
        
    var nextIndex: Int!
        
    let pages = [
        Page(imageName: "BBQ", headerText: "Crack open a cold one and fire up the grill", isLastPage: false),
        Page(imageName: "games", headerText: "Be toxic and play games with your significant other", isLastPage: false),
        Page(imageName: "percs", headerText: "Most importantly stay medicated and elevated", isLastPage: true),
    ]
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = .blue
        pc.pageIndicatorTintColor = .purple
        return pc
    }()
        
    fileprivate func setupBottomControls() {
        let bottomControls = UIView()
        view.addSubview(bottomControls)

        bottomControls.addSubview(pageControl)
        bottomControls.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            bottomControls.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControls.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControls.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControls.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x / view.frame.width)
    }
    
    @objc func buttonTapped() {
        print("button pressed")
        let nextVc = LogInViewController()
        self.navigationController?.initRootViewController(vc: nextVc)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView?.backgroundColor = .white
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.isPagingEnabled = true
        collectionView.reloadData()
        
        self.view.addSubview(collectionView)
        
        setupBottomControls()
    }
}

// MARK: CollectionViewDelegate & Datasource
extension SwipeController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
        let page = pages[indexPath.item]
        cell.page = page
        cell.continueButton.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
}
