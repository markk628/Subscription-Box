//
//  FeaturedCellCollectionViewCell.swift
//  OnboardingFlow
//
//  Created by Mark Kim on 4/23/20.
//  Copyright © 2020 Mark Kim. All rights reserved.
//

import UIKit

class FeaturedCell: UICollectionViewCell {
    
    static var identifier: String = "FeaturedCell"
    
    private let imgView: UIImageView = {
        let img = UIImageView()
        img.backgroundColor = UIColor(red: 0/255, green: 224/255, blue: 199/255, alpha: 1.0)
        img.image = UIImage(named: "food")
        img.layer.cornerRadius = 10.0
        img.contentMode = .center
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private let itemName: UILabel = {
        let itemName = UILabel()
        itemName.textAlignment = .center
        itemName.textColor = UIColor(red: 0/255, green: 72/255, blue: 70/255, alpha: 1.0)
        itemName.text = "Steak"
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
        addSubview(imgView)
        addSubview(itemName)
        
        NSLayoutConstraint.activate([
            imgView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            imgView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            imgView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            imgView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            
            itemName.heightAnchor.constraint(equalToConstant: 35),
            itemName.topAnchor.constraint(equalTo: imgView.centerYAnchor, constant: 30),
            itemName.leadingAnchor.constraint(equalTo: imgView.leadingAnchor, constant: 30),
            itemName.trailingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: -30),
            
        ])
    }
}
