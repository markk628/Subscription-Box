//
//  CartTableViewCell.swift
//  OnboardingFlow
//
//  Created by Mark Kim on 5/5/20.
//  Copyright © 2020 Mark Kim. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    
    let imageViewIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let itemName: UILabel = {
        let imageName = UILabel()
        imageName.translatesAutoresizingMaskIntoConstraints = false
        return imageName
    }()
    
    let quantity: UILabel = {
        let quantity = UILabel()
        quantity.translatesAutoresizingMaskIntoConstraints = false
        return quantity
    }()
    
    static let identifier = "CartItemCell"

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setUpLayout() {
        self.addSubview(imageViewIcon)
        self.addSubview(itemName)
        self.addSubview(quantity)
        NSLayoutConstraint.activate([
            imageViewIcon.topAnchor.constraint(equalTo: self.topAnchor),
            imageViewIcon.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            imageViewIcon.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageViewIcon.widthAnchor.constraint(equalTo: imageViewIcon.heightAnchor),
            
            
        ])
    }
    
    func configure(_ item: Item) {
        self.imageViewIcon.image = item.image.image
        self.itemName.text = item.name
        self.quantity.text = "Quantity: \(item.quantity)"
    }

}
