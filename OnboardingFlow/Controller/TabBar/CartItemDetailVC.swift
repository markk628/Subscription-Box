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
    
    let imageViewIcon: UIImageView = {
        let imageViewIcon = UIImageView()
        imageViewIcon.translatesAutoresizingMaskIntoConstraints = false
        imageViewIcon.contentMode = .scaleAspectFit
        return imageViewIcon
    }()
    
    let itemName: UILabel = {
        let itemName = UILabel()
        itemName.translatesAutoresizingMaskIntoConstraints = false
        
        return itemName
    }()
    
    let itemDescription: UILabel = {
        let itemDescription = UILabel()
        itemDescription.translatesAutoresizingMaskIntoConstraints = false
        return itemDescription
    }()
    
    let addedDate: UILabel = {
        let addedDate = UILabel()
        addedDate.translatesAutoresizingMaskIntoConstraints = false
        return addedDate
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func updateUI() {
        title = item.name
        imageViewIcon.image = item.selectedImage.image
        itemName.text = item.name
        itemDescription.text = item.description
        addedDate.text = item.dateCreated.stringValue
    }
}
