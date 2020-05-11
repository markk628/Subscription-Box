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
        img.backgroundColor = .blue
        img.layer.cornerRadius = 10.0
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
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
        
        NSLayoutConstraint.activate([
            imgView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            imgView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            imgView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            imgView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
        ])
    }
}
