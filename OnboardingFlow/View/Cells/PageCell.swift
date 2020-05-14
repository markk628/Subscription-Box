//
//  PageCell.swift
//  OnboardingFlow
//
//  Created by Mark Kim on 4/9/20.
//  Copyright © 2020 Mark Kim. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    static let identifier = "PageCell"
    
    var page: Page? {
        didSet {
            guard let unwrappedPage = page else { return }
            imageView.image = UIImage(named: unwrappedPage.imageName)
            let attributedText = NSMutableAttributedString(string: unwrappedPage.headerText, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
            descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center
            descriptionTextView.textColor = UIColor(red: 0/255, green: 62/255, blue: 70/255, alpha: 1.0)
            continueButton.isHidden = !page!.isLastPage
        }
    }
    
    private let imageView: UIImageView = {
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
        addSubview(imageView)
        addSubview(descriptionTextView)
        addSubview(continueButton)
        
        NSLayoutConstraint.activate([
            
            imageView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            imageView.topAnchor.constraint(equalToSystemSpacingBelow: self.safeAreaLayoutGuide.topAnchor, multiplier: 0.25),
            imageView.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor, multiplier: 0.5),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor),
            
            descriptionTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 24),
            descriptionTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -24),
            descriptionTextView.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            continueButton.heightAnchor.constraint(equalToConstant: 70),
            continueButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 65),
            continueButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -65),
            continueButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -135)
        ])
    }
}
