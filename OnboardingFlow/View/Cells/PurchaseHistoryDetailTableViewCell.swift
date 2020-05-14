//
//  PurchaseHistoryDetailTableViewCell.swift
//  OnboardingFlow
//
//  Created by Mark Kim on 5/4/20.
//  Copyright © 2020 Mark Kim. All rights reserved.
//

import UIKit

class PurchaseHistoryDetailTableViewCell: UITableViewCell {
    
    static let identifier = "PurchaseHistoryDetailCell"
    
    private let itemImage: UIImageView = {
        let itemImage = UIImageView()
        itemImage.contentMode = .center
        itemImage.translatesAutoresizingMaskIntoConstraints = false
        return itemImage
    }()
    
    private let background: UIView = {
        let background = UIView()
        background.backgroundColor = UIColor(red: 0/255, green: 224/255, blue: 199/255, alpha: 1.0)
        background.layer.cornerRadius = 5
        background.layer.masksToBounds = true
        background.translatesAutoresizingMaskIntoConstraints = false
        return background
    }()
    
    private let favoriteButton: UIButton = {
        let favBtn = UIButton()
        favBtn.setImage(UIImage(named: "fav"), for: .normal)
        favBtn.backgroundColor = .gray
        favBtn.tintColor = .yellow
        favBtn.translatesAutoresizingMaskIntoConstraints = false
        return favBtn
    }()

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpBackground()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setUpBackground()
    }
    
    private func setUpBackground() {
      
        
        self.contentView.addSubview(itemImage)
        self.contentView.addSubview(background)
        self.contentView.addSubview(favoriteButton)
        NSLayoutConstraint.activate([
            itemImage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 20),
            itemImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            itemImage.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant:  -20),
            itemImage.widthAnchor.constraint(equalTo: itemImage.heightAnchor),
            
            favoriteButton.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            favoriteButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            favoriteButton.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            favoriteButton.widthAnchor.constraint(equalTo: favoriteButton.heightAnchor),
            
            background.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            background.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            background.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
        ])
    }
    
}
