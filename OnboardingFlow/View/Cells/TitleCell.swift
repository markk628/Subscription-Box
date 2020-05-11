//
//  TitleCell.swift
//  OnboardingFlow
//
//  Created by Mark Kim on 4/23/20.
//  Copyright © 2020 Mark Kim. All rights reserved.
//

import UIKit

class TitleCell: UICollectionViewCell {
    
    static var identifier: String = "TitleCell"
    
    private let borderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray3
        return view
    }()
    
    private let labelTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpLayout() {
        addSubview(labelTitle)
        addSubview(borderView)
        
        NSLayoutConstraint.activate([
            labelTitle.topAnchor.constraint(equalTo: topAnchor),
            labelTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            labelTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            labelTitle.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -5),
            
            borderView.heightAnchor.constraint(equalToConstant: 1),
            borderView.leadingAnchor.constraint(equalTo: leadingAnchor),
            borderView.trailingAnchor.constraint(equalTo: trailingAnchor),
            borderView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
    }
    
    func set(title: String) {
        labelTitle.text = title
    }
}
