//
//  CategoriesVC.swift
//  OnboardingFlow
//
//  Created by Mark Kim on 4/26/20.
//  Copyright © 2020 Mark Kim. All rights reserved.
//

import UIKit

class CategoriesVC: UIViewController, UICollectionViewDelegateFlowLayout {
    
    var collectionView : UICollectionView!
    
    let categories = [
        Category(imageName: "krabbyPatty", name: "Everything Grill"),
        Category(imageName: "mario&some", name: "Games"),
        Category(imageName: "gas", name: "Medication")
    ]
    
    lazy var categoryControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = categories.count
        pc.currentPageIndicatorTintColor = UIColor(red: 0/255, green: 62/255, blue: 70/255, alpha: 1.0)
        pc.pageIndicatorTintColor = UIColor(red: 0/255, green: 93/255, blue: 94/255, alpha: 1.0)
        return pc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView?.backgroundColor = .white
        collectionView?.register(CategoryCell.self, forCellWithReuseIdentifier: "categoryId")
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.isPagingEnabled = true
        collectionView.reloadData()
        
        self.view.addSubview(collectionView)
        
        setUpBottomControls()
    }
    
    fileprivate func setUpBottomControls() {
        let bottomControls = UIView()
        view.addSubview(bottomControls)

        bottomControls.addSubview(categoryControl)
        bottomControls.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            bottomControls.heightAnchor.constraint(equalToConstant: 50),
            bottomControls.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControls.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControls.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    @objc func viewItemsButtonTapped() {
        
    }
}
