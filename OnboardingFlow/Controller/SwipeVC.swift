//
//  SwipeVC.swift
//  OnboardingFlow
//
//  Created by Mark Kim on 4/9/20.
//  Copyright © 2020 Mark Kim. All rights reserved.
//

import UIKit

class SwipeVC: UIViewController, UICollectionViewDelegateFlowLayout {
    
    var collectionView : UICollectionView!
                
    let pages = [
        Page(imageName: "BBQ", headerText: "Crack open a cold one and fire up the grill", isLastPage: false),
        Page(imageName: "games", headerText: "Be toxic and play games with your significant other", isLastPage: false),
        Page(imageName: "percs", headerText: "Most importantly stay medicated and elevated", isLastPage: true),
    ]
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = UIColor(red: 0/255, green: 62/255, blue: 70/255, alpha: 1.0)
        pc.pageIndicatorTintColor = UIColor(red: 0/255, green: 93/255, blue: 94/255, alpha: 1.0)
        return pc
    }()
        
    fileprivate func setUpBottomControls() {
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
    
    @objc func continueButtonTapped() {
        let nextVc = LogInVC()
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
        
        setUpBottomControls()
    }
}

