//
//  PurchaseHistoryDetailTableViewCell.swift
//  OnboardingFlow
//
//  Created by Mark Kim on 5/4/20.
//  Copyright © 2020 Mark Kim. All rights reserved.
//

import UIKit

class PurchaseHistoryDetailTableViewCell: UITableViewCell {
    
    let background: UIView = {
        let background = UIView()
        background.backgroundColor = UIColor(red: 0/255, green: 224/255, blue: 199/255, alpha: 1.0)
        background.layer.cornerRadius = 5
        background.layer.masksToBounds = true
        background.translatesAutoresizingMaskIntoConstraints = false
        return background
    }()
    
//    let itemImage: UIImageView = {
//        let itemImage = UIImageView()
//        itemImage.layer.cornerRadius = 5
//        itemImage.layer.masksToBounds = true
//        itemImage.image 
//    }

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
    
    func setUpBackground() {
        self.contentView.addSubview(background)
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            background.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            background.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
        ])
    }
    
}