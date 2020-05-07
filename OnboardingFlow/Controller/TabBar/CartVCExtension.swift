//
//  CartVCExtension.swift
//  OnboardingFlow
//
//  Created by Mark Kim on 5/6/20.
//  Copyright © 2020 Mark Kim. All rights reserved.
//

import UIKit

extension CartVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persistence.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CartTableViewCell.identifier, for: indexPath) as! CartTableViewCell
        let item = persistence.items[indexPath.row]
        cell.configure(item)
        cell.textLabel?.textColor = UIColor(red: 0/255, green: 62/255, blue: 70/255, alpha: 1.0)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = persistence.items[indexPath.row]
        let itemDetailVC = CartItemDetailVC()
        itemDetailVC.item
        navigationController?.pushViewController(itemDetailVC, animated: true)
    }
}
