//
//  LoginVC.swift
//  OnboardingFlow
//
//  Created by Mark Kim on 4/14/20.
//  Copyright © 2020 Mark Kim. All rights reserved.
//

import UIKit

class LogInVC: UIViewController {
    
    private let imageContainerView: UIView = {
        let imageContainerView = UIView()
        imageContainerView.translatesAutoresizingMaskIntoConstraints = false
        return imageContainerView
    }()
    
    private let appNameLabel: UILabel = {
        let nameLabel = UILabel()
        let attributedText = NSAttributedString(string: "Quarantine Box", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 25)])
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
    
    private let logInButton: UIButton = {
        let logInBtn = UIButton()
        logInBtn.backgroundColor = UIColor(red: 0/255, green: 224/255, blue: 199/255, alpha: 1.0)
        logInBtn.setTitle("Log In", for: UIControl.State.normal)
        logInBtn.setTitleColor(UIColor(red: 0/255, green: 62/255, blue: 70/255, alpha: 1.0), for: UIControl.State.normal)
        logInBtn.translatesAutoresizingMaskIntoConstraints = false
        return logInBtn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayout()
        view.backgroundColor = .white
        logInButton.addTarget(self, action: #selector(self.logInButtonTapped), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(self.backButtonTapped))
    }
    
    private func setUpLayout() {
        view.addSubview(imageContainerView)
        view.addSubview(appNameLabel)
        view.addSubview(appDescriptionLabel)
        view.addSubview(userNameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(logInButton)
        imageContainerView.addSubview(appImage)
        
        NSLayoutConstraint.activate([
            appNameLabel.heightAnchor.constraint(equalToConstant: 30),
            appNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            appNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: -50),
            appNameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 50),

            imageContainerView.heightAnchor.constraint(equalToConstant: 300),
            imageContainerView.topAnchor.constraint(equalTo: appNameLabel.bottomAnchor),
            imageContainerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            imageContainerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            appImage.centerXAnchor.constraint(equalTo: imageContainerView.centerXAnchor),
            appImage.centerYAnchor.constraint(equalTo: imageContainerView.centerYAnchor),
            appImage.heightAnchor.constraint(equalTo: imageContainerView.heightAnchor, multiplier: 0.5),
            
            appDescriptionLabel.heightAnchor.constraint(equalToConstant: 50),
            appDescriptionLabel.topAnchor.constraint(equalTo: imageContainerView.bottomAnchor),
            appDescriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: -24),
            appDescriptionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 24),
            
            userNameTextField.heightAnchor.constraint(equalToConstant: 50),
            userNameTextField.topAnchor.constraint(equalTo: appDescriptionLabel.bottomAnchor),
            userNameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            userNameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 5),
            passwordTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            passwordTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            logInButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            logInButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
        ])
    }
    
    @objc func logInButtonTapped() {
        let nextVc = TabBarVCs()
        self.navigationController?.initRootViewController(vc: nextVc, navBarHidden: false)
        
    }
    
    @objc func backButtonTapped() {
        let lastVC = SwipeVC()
        self.navigationController?.initRootViewController(vc: lastVC, navBarHidden: false)
    }
}


