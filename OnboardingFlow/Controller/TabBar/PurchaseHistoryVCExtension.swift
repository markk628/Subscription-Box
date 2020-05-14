//
//  PurchaseHistoryVCExtension.swift
//  OnboardingFlow
//
//  Created by Mark Kim on 4/18/20.
//  Copyright © 2020 Mark Kim. All rights reserved.
//

import UIKit

extension PurchaseHistoryVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return monthArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PurchaseHistoryTableViewCell.identifier, for: indexPath)
        cell.textLabel?.text = "\(monthArray[indexPath.row])"
        cell.textLabel?.textColor = UIColor(red: 0/255, green: 62/255, blue: 70/255, alpha: 1.0)
        return cell
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let purchaseHistoryDetailVC = PurchaseHistoryDetailVC()
        navigationController?.pushViewController(purchaseHistoryDetailVC, animated: true)
    }
}
