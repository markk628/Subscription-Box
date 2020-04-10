//
//  ViewController.swift
//  OnboardingFlow
//
//  Created by Mark Kim on 4/8/20.
//  Copyright © 2020 Mark Kim. All rights reserved.
//

//import UIKit
//
//class ViewController: UIViewController {
//
//    let bbqImageView: UIImageView = {
//        let imageView = UIImageView(image: #imageLiteral(resourceName: "BBQ.png"))
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.contentMode = .scaleAspectFit
//        return imageView
//    }()
//    
//    let descriptionTextView: UITextView = {
//        let textView = UITextView()
//        let attributedText = NSMutableAttributedString(string: "Crack a cold one and fire up the grill", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
//        
//        textView.attributedText = attributedText
//        textView.translatesAutoresizingMaskIntoConstraints = false
//        textView.textAlignment = .center
//        textView.isEditable = false
//        textView.isScrollEnabled = false
//        return textView
//    }()
//    
//    private let pageControl: UIPageControl = {
//        let pc = UIPageControl()
//        pc.currentPage = 0
//        pc.numberOfPages = 3
//        pc.currentPageIndicatorTintColor = .blue
//        pc.pageIndicatorTintColor = .purple
//        return pc
//    }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.addSubview(descriptionTextView)
//        
//        setupBottomControls()
//        setupLayout()
//    }
//    
//    fileprivate func setupBottomControls() {
//        let bottomControlsStackView = UIStackView(arrangedSubviews: [pageControl])
//        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
//        bottomControlsStackView.distribution = .fillEqually
//        
//        view.addSubview(bottomControlsStackView)
//        
//        NSLayoutConstraint.activate([
//            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
//            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
//            ])
//    }
//    
//    private func setupLayout() {
//        let topImageContainerView = UIView()
//        view.addSubview(topImageContainerView)
//        topImageContainerView.addSubview(bbqImageView)
//        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
//        
//        NSLayoutConstraint.activate([
//            topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor),
//            topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
//
//            bbqImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor),
//            bbqImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor),
//            bbqImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5),
//            
//            descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor),
//            descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
//            descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24),
//            descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
//        ])
//    }
//}

