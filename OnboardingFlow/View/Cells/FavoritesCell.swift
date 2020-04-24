//
//  FavoritesCell.swift
//  OnboardingFlow
//
//  Created by Mark Kim on 4/23/20.
//  Copyright © 2020 Mark Kim. All rights reserved.
//

import UIKit

class FavoritesCell: UICollectionViewCell {
    
    static var identifier: String = "FavoritesCell"
    
    let favoritesView: UIImageView = {
        let favView = UIImageView()
        favView.layer.cornerRadius = 10
        favView.backgroundColor = .blue
        favView.translatesAutoresizingMaskIntoConstraints = false
        return favView
    }()
    
    let itemLabel: UILabel = {
        let itemName = UILabel()
        itemName.text = "Item Name"
        itemName.translatesAutoresizingMaskIntoConstraints = false
        return itemName
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpLayout() {
        addSubview(favoritesView)
        addSubview(itemLabel)
        
        NSLayoutConstraint.activate([
            favoritesView.widthAnchor.constraint(equalTo: favoritesView.heightAnchor, multiplier: 1/1),
            favoritesView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            favoritesView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            favoritesView.trailingAnchor.constraint(equalTo: itemLabel.leadingAnchor, constant: -5),
            favoritesView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            
            itemLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            itemLabel.leadingAnchor.constraint(equalTo: favoritesView.trailingAnchor, constant: 5),
            itemLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            itemLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
    }
}
