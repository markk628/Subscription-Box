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
        nameLabel.textColor = UIColor(red: 0/255, green: 62/255, blue: 70/255, alpha: 1.0)
        nameLabel.textAlignment = .center
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    private let appImage: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "socialDistancing.png"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let appDescriptionLabel: UILabel = {
        let describtionLabel = UILabel()
        let attributedText = NSAttributedString(string: "Essentials delivered", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        describtionLabel.attributedText = attributedText
        describtionLabel.textColor = UIColor(red: 0/255, green: 62/255, blue: 70/255, alpha: 1.0)
        describtionLabel.textAlignment = .center
        describtionLabel.translatesAutoresizingMaskIntoConstraints = false
        return describtionLabel
    }()
    
    private let userNameTextField: UITextField = {
        let userName = UITextField()
        userName.placeholder = "username"
        userName.translatesAutoresizingMaskIntoConstraints = false
        return userName
    }()
    
    private let passwordTextField: UITextField = {
        let password = UITextField()
        password.placeholder = "password"
        password.translatesAutoresizingMaskIntoConstraints = false
        return password
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
        view.addSubview(userNameTextField)
        view.addSubview(passwordTextField)
        imageContainerView.addSubview(appImage)
        imageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            appNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
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
            appDescriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -24),
            appDescriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 24),
            appDescriptionLabel.heightAnchor.constraint(equalToConstant: 80),
            
            userNameTextField.topAnchor.constraint(equalTo: appDescriptionLabel.bottomAnchor),
            userNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            userNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            userNameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTextField.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 15),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50)
            
            
        ])
    }
}


