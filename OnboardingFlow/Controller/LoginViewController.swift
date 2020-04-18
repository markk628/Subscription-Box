//
//  LoginViewController.swift
//  OnboardingFlow
//
//  Created by Mark Kim on 4/14/20.
//  Copyright © 2020 Mark Kim. All rights reserved.
//

import Foundation
import UIKit

class LogInViewController: UIViewController {
    
    private let appNameLabel: UILabel = {
        let nameLabel = UILabel()
        let attributedText = NSAttributedString(string: "Quarantined", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 25)])
        nameLabel.attributedText = attributedText
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textAlignment = .center
        return nameLabel
    }()
    
    private let appImage: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "socialDistancing.png"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let appDescriptionLabel: UILabel = {
        let describtionLabel = UILabel()
        let attributedText = NSAttributedString(string: "Social Distancing Done Right", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        describtionLabel.attributedText = attributedText
        describtionLabel.translatesAutoresizingMaskIntoConstraints = false
        describtionLabel.textAlignment = .center
        return describtionLabel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        view.backgroundColor = .white
    }
    
    private func setupLayout() {
        let imageContainerView = UIView()
        view.addSubview(appNameLabel)
        view.addSubview(imageContainerView)
        view.addSubview(appDescriptionLabel)
        imageContainerView.addSubview(appImage)
        imageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            appNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            appNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -50),
            appNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 50),
            appNameLabel.heightAnchor.constraint(equalToConstant: 80),

            imageContainerView.topAnchor.constraint(equalTo: appNameLabel.bottomAnchor),
            imageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            
            appImage.centerXAnchor.constraint(equalTo: imageContainerView.centerXAnchor),
            appImage.centerYAnchor.constraint(equalTo: imageContainerView.centerYAnchor),
            appImage.heightAnchor.constraint(equalTo: imageContainerView.heightAnchor, multiplier: 0.5),
            
            appDescriptionLabel.topAnchor.constraint(equalTo: imageContainerView.bottomAnchor),
            appDescriptionLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            appDescriptionLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24),
            appDescriptionLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        ])
    }
}


