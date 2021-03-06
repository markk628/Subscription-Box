//
//  CategoryCell.swift
//  OnboardingFlow
//
//  Created by Mark Kim on 4/26/20.
//  Copyright © 2020 Mark Kim. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    var category: Category? {
        didSet {
            guard let unwrappedCategory = category else { return }
            bbqImageView.image = UIImage(named: unwrappedCategory.imageName)
            let attributedText = NSMutableAttributedString(string: unwrappedCategory.name, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
            descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center
            descriptionTextView.textColor = UIColor(red: 0/255, green: 62/255, blue: 70/255, alpha: 1.0)
        }
    }
    
    private let topImageContainerView: UIView = {
        let topImageContainerView = UIView()
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        return topImageContainerView
    }()
    
    private let bbqImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "BBQ.png"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let descriptionTextView: UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "some string", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        textView.attributedText = attributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    let continueButton: UIButton = {
        let cButton = UIButton()
        cButton.backgroundColor = UIColor(red: 0/255, green: 224/255, blue: 199/255, alpha: 1.0)
        cButton.setTitle("Continue", for: UIControl.State.normal)
        cButton.setTitleColor(UIColor(red: 0/255, green: 72/255, blue: 70/255, alpha: 1.0), for: UIControl.State.normal)
        cButton.translatesAutoresizingMaskIntoConstraints = false
        return cButton
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        continueButton.isHidden = true
    }

    private func setUpLayout() {
        addSubview(topImageContainerView)
        addSubview(descriptionTextView)
        addSubview(continueButton)
        topImageContainerView.addSubview(bbqImageView)
        
        NSLayoutConstraint.activate([
            topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
            topImageContainerView.topAnchor.constraint(equalTo: topAnchor),
            topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),

            bbqImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor),
            bbqImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor),
            bbqImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5),
            
            descriptionTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 24),
            descriptionTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -24),
            descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor),
            descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            continueButton.heightAnchor.constraint(equalToConstant: 100),
            continueButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 50),
            continueButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -50),
            continueButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -150),
        ])
    }
}
