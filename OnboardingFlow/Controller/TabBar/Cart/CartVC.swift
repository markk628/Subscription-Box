//
//  CartVC.swift
//  OnboardingFlow
//
//  Created by Mark Kim on 5/4/20.
//  Copyright © 2020 Mark Kim. All rights reserved.
//

import UIKit

class CartVC: UIViewController {
    
    var persistence = PersistenceLayer()
    
    var items: [Item] = [
        Item(name: "Steak", description: "T-Bone", image: Item.Images.food),
        Item(name: "Water", description: "Straight from Antarctica", image: Item.Images.drop),
        Item(name: "a game", description: "a description", image: Item.Images.game),
        Item(name: "sleeping pill", description: "so I can sleep duh", image: Item.Images.pill)
    ]

    private let table: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.rowHeight = 100
        table.backgroundColor = UIColor(red: 0/255, green: 224/255, blue: 199/255, alpha: 1.0)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCartTable()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        persistence.setNeedsToReloadItems()
        table.reloadData()
    }
    
    private func setCartTable() {
        view.addSubview(table)
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            table.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            table.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
        ])
        
        table.register(CartTableViewCell.self, forCellReuseIdentifier: CartTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
    }
}
