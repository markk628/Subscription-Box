//
//  PurchaseHistoryVC.swift
//  OnboardingFlow
//
//  Created by Mark Kim on 4/23/20.
//  Copyright © 2020 Mark Kim. All rights reserved.
//

import UIKit

class PurchaseHistoryVC: UIViewController {

    let monthArray: [String] = ["January ❄️", "February ❄️", "March 🌼", "April 🌼", "May 🌼", "June ☀️", "July ☀️", "August ☀️", "September 🍃", "October 🍃", "November 🍃", "December ❄️"]
    
    private let table: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.rowHeight = 100
        table.backgroundColor = UIColor(red: 0/255, green: 224/255, blue: 199/255, alpha: 1.0)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMonthTable()
    }
    
    private func setMonthTable() {
        view.addSubview(table)
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            table.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            table.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
        ])
        
        table.register(PurchaseHistoryTableViewCell.self, forCellReuseIdentifier: PurchaseHistoryTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
    }
}
