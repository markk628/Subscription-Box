//
//  CartItemDetailVC.swift
//  OnboardingFlow
//
//  Created by Mark Kim on 5/6/20.
//  Copyright © 2020 Mark Kim. All rights reserved.
//

import UIKit

class CartItemDetailVC: UIViewController {
    
    var item: Item!
    var itemIndex: Int!
    
    private var persistence = PersistenceLayer()
    
    private let imageViewIcon: UIImageView = {
        let imageViewIcon = UIImageView()
        imageViewIcon.translatesAutoresizingMaskIntoConstraints = false
        imageViewIcon.contentMode = .scaleAspectFit
        return imageViewIcon
    }()
    
    private let itemName: UILabel = {
        let itemName = UILabel()
        itemName.translatesAutoresizingMaskIntoConstraints = false
        return itemName
    }()
    
    private let itemDescription: UILabel = {
        let itemDescription = UILabel()
        itemDescription.translatesAutoresizingMaskIntoConstraints = false
        return itemDescription
    }()
    
    private let addedDate: UILabel = {
        let addedDate = UILabel()
        addedDate.translatesAutoresizingMaskIntoConstraints = false
        return addedDate
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpCartItemDetailLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }
    
    private func setUpCartItemDetailLayout() {
        view.addSubview(imageViewIcon)
        view.addSubview(itemName)
        view.addSubview(itemDescription)
        view.addSubview(addedDate)
        
        NSLayoutConstraint.activate([
            imageViewIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageViewIcon.widthAnchor.constraint(equalToConstant: 240),
            imageViewIcon.heightAnchor.constraint(equalToConstant: 240),
            imageViewIcon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            
            itemName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            itemName.widthAnchor.constraint(equalToConstant: 240),
            itemName.heightAnchor.constraint(equalToConstant: 35),
            itemName.topAnchor.constraint(equalTo: imageViewIcon.bottomAnchor, constant: 30),
            
            addedDate.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addedDate.widthAnchor.constraint(equalToConstant: 240),
            addedDate.heightAnchor.constraint(equalToConstant: 35),
            addedDate.topAnchor.constraint(equalTo: itemName.bottomAnchor, constant: 10),
            
            itemDescription.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            itemDescription.widthAnchor.constraint(equalToConstant: 260),
            itemDescription.heightAnchor.constraint(greaterThanOrEqualToConstant: 35),
            itemDescription.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30)
        ])
    }
    
    private func updateUI() {
        title = item.name
        imageViewIcon.image = item.selectedImage.image
        itemName.text = item.name
        itemDescription.text = item.description
        addedDate.text = item.dateCreated.stringValue
    }
}
