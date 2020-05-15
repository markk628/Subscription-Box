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
    
    private let background: UIView = {
        let background = UIView()
        background.backgroundColor = UIColor(red: 0/255, green: 224/255, blue: 199/255, alpha: 1.0)
        background.layer.cornerRadius = 5
        background.layer.masksToBounds = true
        background.translatesAutoresizingMaskIntoConstraints = false
        return background
    }()
    
    private let itemImage: UIImageView = {
        let itemImage = UIImageView()
        itemImage.layer.masksToBounds = true
        itemImage.translatesAutoresizingMaskIntoConstraints = false
        return itemImage
    }()
    
    private let itemName: UILabel = {
        let itemName = UILabel()
        itemName.translatesAutoresizingMaskIntoConstraints = false
        return itemName
    }()
    
    private var favoriteButton: UIButton = {
        let favBtn = UIButton()
        favBtn.setImage(UIImage(named: "fav"), for: .normal)
        favBtn.imageView?.backgroundColor = .white
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
        favoriteButton.addTarget(self, action: #selector(addToFavorites), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setUpBackground()
        favoriteButton.addTarget(self, action: #selector(addToFavorites), for: .touchUpInside)
    }
    
    private func setUpBackground() {
        self.contentView.addSubview(background)
        background.addSubview(itemImage)
        background.addSubview(itemName)
        background.addSubview(favoriteButton)
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            background.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            background.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            
            itemImage.widthAnchor.constraint(equalTo: itemImage.heightAnchor),
            itemImage.topAnchor.constraint(equalTo: background.topAnchor, constant: 20),
            itemImage.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 10),
            itemImage.bottomAnchor.constraint(equalTo: background.bottomAnchor, constant: -10),
            
            itemName.topAnchor.constraint(equalTo: background.topAnchor, constant: 10),
            itemName.leadingAnchor.constraint(equalTo: itemImage.trailingAnchor, constant: 10),
            itemName.trailingAnchor.constraint(equalTo: favoriteButton.leadingAnchor, constant: -10),
            itemName.bottomAnchor.constraint(equalTo: background.bottomAnchor, constant: -10),

            favoriteButton.topAnchor.constraint(equalTo: background.topAnchor, constant: 20),
            favoriteButton.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant:  -10),
            favoriteButton.bottomAnchor.constraint(equalTo: background.bottomAnchor, constant:  -20),
            favoriteButton.widthAnchor.constraint(equalTo: favoriteButton.heightAnchor),
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    @objc func addToFavorites() {
        favoriteButton.imageView?.backgroundColor = .yellow
    }
}
