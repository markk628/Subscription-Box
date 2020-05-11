//
//  ConfirmItemVC.swift
//  OnboardingFlow
//
//  Created by Mark Kim on 5/9/20.
//  Copyright © 2020 Mark Kim. All rights reserved.
//

import UIKit

class ConfirmItemVC: UIViewController {
    
    var itemImage: Item.Images!
    
    private let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let itemNameTextField: UITextField = {
        let itemNameTF = UITextField()
        itemNameTF.placeholder = "Item Name"
        itemNameTF.translatesAutoresizingMaskIntoConstraints = false
        return itemNameTF
    }()
    
    private let itemDescriptionTextField: UITextField = {
        let itemDescriptionTF = UITextField()
        itemDescriptionTF.placeholder = "Item Description"
        itemDescriptionTF.translatesAutoresizingMaskIntoConstraints = false
        return itemDescriptionTF
    }()
    
    private let addItemButton: UIButton = {
        let addItemBtn = UIButton()
        addItemBtn.backgroundColor = UIColor(red: 0/255, green: 224/255, blue: 199/255, alpha: 1.0)
        addItemBtn.setTitle("Add Item", for: UIControl.State.normal)
        addItemBtn.setTitleColor(UIColor(red: 0/255, green: 62/255, blue: 70/255, alpha: 1.0), for: UIControl.State.normal)
        addItemBtn.translatesAutoresizingMaskIntoConstraints = false
        return addItemBtn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }
    
    private func setUpLayout() {
        view.addSubview(itemImageView)
        view.addSubview(itemNameTextField)
        view.addSubview(itemDescriptionTextField)
        view.addSubview(addItemButton)
        
        NSLayoutConstraint.activate([
            itemImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            itemImageView.widthAnchor.constraint(equalToConstant: 240),
            itemImageView.heightAnchor.constraint(equalToConstant: 240),
            itemImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 55),
            
            itemNameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            itemNameTextField.widthAnchor.constraint(equalToConstant: 240),
            itemNameTextField.heightAnchor.constraint(equalToConstant: 35),
            itemNameTextField.topAnchor.constraint(equalTo: itemImageView.bottomAnchor, constant: 30),
            
            itemDescriptionTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            itemDescriptionTextField.widthAnchor.constraint(equalToConstant: 260),
            itemDescriptionTextField.heightAnchor.constraint(greaterThanOrEqualToConstant: 35),
            itemDescriptionTextField.topAnchor.constraint(equalTo: itemNameTextField.bottomAnchor, constant: 30),
            
            addItemButton.heightAnchor.constraint(equalToConstant: 50),
            addItemButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            addItemButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            addItemButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 30),
        ])
    }
    
    private func updateUI() {
        title = "Add New Item"
        itemImageView.image = itemImage.image
    }
    
    @objc func addItemButtonTapped(_ sender: Any) {
        var persistenceLayer = PersistenceLayer()
        let itemDescription = itemDescriptionTextField.text ?? "No Description"
        guard let itemText = itemNameTextField.text else { return }
        persistenceLayer.createNewItem(name: itemText, description: itemDescription, image: itemImage)
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }

}
