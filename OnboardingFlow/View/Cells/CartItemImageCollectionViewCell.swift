//
//  CartItemImageCollectionViewCell.swift
//  OnboardingFlow
//
//  Created by Mark Kim on 5/9/20.
//  Copyright © 2020 Mark Kim. All rights reserved.
//

import UIKit

class CartItemImageCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ItemImageCell"
    
    private let itemImage: UIImageView = {
        let itemImage = UIImageView()
        itemImage.contentMode = .center
        itemImage.translatesAutoresizingMaskIntoConstraints = false
        return itemImage
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImage(image: UIImage, withSelection: Bool) {
        if withSelection {
            self.itemImage.image = image.withRenderingMode(.alwaysOriginal)
        } else {
            self.itemImage.image = image.withRenderingMode(.alwaysTemplate)
            self.itemImage.tintColor = UIColor.gray
        }
    }
    
    private func setUpLayout() {
        self.addSubview(itemImage)
        
        NSLayoutConstraint.activate([
            itemImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 15),
            itemImage.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            itemImage.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            itemImage.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -60),
        ])
    }
}
