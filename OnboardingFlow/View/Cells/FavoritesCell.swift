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
    
    private let favoritesView: UIImageView = {
        let favView = UIImageView()
        favView.layer.cornerRadius = 10
        favView.backgroundColor = UIColor(red: 0/255, green: 224/255, blue: 199/255, alpha: 1.0)
        favView.image = UIImage(named: "food")
        favView.translatesAutoresizingMaskIntoConstraints = false
        return favView
    }()
    
    private let itemLabel: UILabel = {
        let itemName = UILabel()
        itemName.text = "Steak"
//        itemName.backgroundColor = UIColor(red: 0/255, green: 224/255, blue: 199/255, alpha: 1.0)
        itemName.textColor = UIColor(red: 0/255, green: 72/255, blue: 70/255, alpha: 1.0)
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
