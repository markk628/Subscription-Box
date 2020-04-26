//
//  CategoriesVCExtension.swift
//  OnboardingFlow
//
//  Created by Mark Kim on 4/26/20.
//  Copyright © 2020 Mark Kim. All rights reserved.
//

import UIKit

extension CategoriesVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
            
            coordinator.animate(alongsideTransition: { (_) in
                //self.collectionViewLayout.invalidateLayout()
                
                if self.categoryControl.currentPage == 0 {
                    self.collectionView?.contentOffset = .zero
                } else {
                    let indexPath = IndexPath(item: self.categoryControl.currentPage, section: 0)
                    self.collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
                }
            }) { (_) in
            }
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return categories.count
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryId", for: indexPath) as! CategoryCell
            let category = categories[indexPath.item]
            cell.category = category
            cell.continueButton.addTarget(self, action: #selector(self.viewItemsButtonTapped), for: .touchUpInside)
            return cell
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: view.frame.width, height: view.frame.height)
        }
    }
