//
//  HomeViewController.swift
//  OnboardingFlow
//
//  Created by Mark Kim on 4/14/20.
//  Copyright © 2020 Mark Kim. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    let monthArray = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    
    let table: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.rowHeight = 100
        table.backgroundColor = UIColor(red: 0/255, green: 224/255, blue: 199/255, alpha: 1.0)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setMonthTable()
    }
    
    func setMonthTable() {
        self.view.addSubview(table)
        NSLayoutConstraint.activate([
            table.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            table.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            table.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            table.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
        ])
        
        table.register(PastBoxesCellTableViewCell.self, forCellReuseIdentifier: "MonthCell")
        table.delegate = self
        table.dataSource = self
    }
}
