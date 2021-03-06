//
//  AddItemVC.swift
//  OnboardingFlow
//
//  Created by Mark Kim on 5/7/20.
//  Copyright © 2020 Mark Kim. All rights reserved.
//

import UIKit

class AddItemVC: UIViewController {
    
    var selectedIndexPath: IndexPath? {
        didSet {
            var indexPath: [IndexPath] = []
            if let selectedIndexPath = selectedIndexPath {
                indexPath.append(selectedIndexPath)
            }
            if let oldValue = oldValue {
                indexPath.append(oldValue)
            }
            collectionView.performBatchUpdates({self.collectionView.reloadItems(at: indexPath)})
        }
    }
    
    let itemImages = Item.Images.allCases
    
    var collectionView: UICollectionView = {
        let addItemVC = UIView()
        let collectionView = UICollectionView(frame: addItemVC.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.reloadData()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
        
    private let pickPhotoButton: UIButton = {
        let pickPhotoButton = UIButton()
        pickPhotoButton.backgroundColor = UIColor(red: 0/255, green: 224/255, blue: 199/255, alpha: 1.0)
        pickPhotoButton.setTitle("Pick Photo", for: UIControl.State.normal)
        pickPhotoButton.setTitleColor(UIColor(red: 0/255, green: 72/255, blue: 70/255, alpha: 1.0), for: UIControl.State.normal)
        pickPhotoButton.translatesAutoresizingMaskIntoConstraints = false
        return pickPhotoButton
    }()
    
    override func loadView() {
        super.loadView()
        title = "New Box"
        collectionView.register(CartItemImageCollectionViewCell.self, forCellWithReuseIdentifier: CartItemImageCollectionViewCell.identifier)
        setUpItemLayout()
        setUpNavBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        pickPhotoButton.addTarget(self, action: #selector(pickPhotoButtonPressed), for: .touchUpInside)

    }
    
    private func setUpItemLayout() {
        view.addSubview(collectionView)
        view.addSubview(pickPhotoButton)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        NSLayoutConstraint.activate([
//            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
//            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
//            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
//            collectionView.bottomAnchor.constraint(equalTo: pickPhotoButton.topAnchor, constant: -15),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            collectionView.bottomAnchor.constraint(equalTo: pickPhotoButton.topAnchor, constant: -15),
            
            pickPhotoButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            pickPhotoButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            pickPhotoButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15)
        ])
    }
    
    private func setUpNavBar() {
        title = "Select Image"
        
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelAddItem(_:)))
        navigationItem.leftBarButtonItem = cancelButton
    }
    
    @objc func cancelAddItem(_ sender: UIBarButtonItem) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @objc func pickPhotoButtonPressed() {
        guard let selectedIndexPath = selectedIndexPath else { return }
        let confirmItemVC = ConfirmItemVC()
        confirmItemVC.itemImage = itemImages[selectedIndexPath.row]
       navigationController?.pushViewController(confirmItemVC, animated: true)
   }
}
