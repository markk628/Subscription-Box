//
//  CartTableViewCell.swift
//  OnboardingFlow
//
//  Created by Mark Kim on 5/5/20.
//  Copyright © 2020 Mark Kim. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    
    static let identifier = "CartItemCell"
    
    private let imageViewIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let itemName: UILabel = {
        let imageName = UILabel()
        imageName.translatesAutoresizingMaskIntoConstraints = false
        return imageName
    }()
    
    private let quantity: UILabel = {
        let quantity = UILabel()
        quantity.translatesAutoresizingMaskIntoConstraints = false
        return quantity
    }()
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        setUpLayout()
    }
    
    
    
    private func setUpLayout() {
        self.addSubview(imageViewIcon)
        self.addSubview(itemName)
        self.addSubview(quantity)
        NSLayoutConstraint.activate([
            imageViewIcon.widthAnchor.constraint(equalTo: imageViewIcon.heightAnchor),
            imageViewIcon.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            imageViewIcon.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            imageViewIcon.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            
            itemName.widthAnchor.constraint(equalToConstant: 133),
            itemName.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            itemName.leadingAnchor.constraint(equalTo: imageViewIcon.trailingAnchor),
            itemName.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            
            quantity.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            quantity.leadingAnchor.constraint(equalTo: itemName.trailingAnchor),
            quantity.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            quantity.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    func configure(_ item: Item) {
        self.imageViewIcon.image = item.selectedImage.image
        self.itemName.text = item.name
        self.quantity.text = "Quantity: \(item.quantity)"
    }

}
