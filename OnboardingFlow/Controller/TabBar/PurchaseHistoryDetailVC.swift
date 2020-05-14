//
//  PurchaseHistoryDetailVC.swift
//  OnboardingFlow
//
//  Created by Mark Kim on 5/4/20.
//  Copyright © 2020 Mark Kim. All rights reserved.
//

import UIKit

class PurchaseHistoryDetailVC: UIViewController {
    
    let boxItemImage: [UIImage] = [#imageLiteral(resourceName: "food.png"), #imageLiteral(resourceName: "drop.png"), #imageLiteral(resourceName: "game.png"), #imageLiteral(resourceName: "pill.png")]
    let boxArray: [String] = ["Steak", "Water", "COD Warzone", "pain killers"]
    
    private let table: UITableView = {
        let table = UITableView()
        table.backgroundColor = UIColor(red: 0/255, green: 224/255, blue: 199/255, alpha: 1.0)
        table.rowHeight = 100
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setItemsTable()
    }
    
    private func setItemsTable() {
        view.addSubview(table)
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            table.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            table.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
        ])
        
        table.register(PurchaseHistoryDetailTableViewCell.self, forCellReuseIdentifier: PurchaseHistoryDetailTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
    }
}
