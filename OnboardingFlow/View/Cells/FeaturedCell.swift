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
    
    let mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUp()
    }
    
    func setUp() {
        mainView.layer.cornerRadius = 10.0
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpLayout() {
        addSubview(mainView)
        
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            mainView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            mainView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
        ])
    }
}
