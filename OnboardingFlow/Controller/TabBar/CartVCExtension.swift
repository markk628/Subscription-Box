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
        itemDetailVC.item = selectedItem
        itemDetailVC.itemIndex = indexPath.row
        navigationController?.pushViewController(itemDetailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            let itemToDelete = persistence.items[indexPath.row]
            let itemIndexToDelete = indexPath.row
            let deleteAlert = UIAlertController(itemName: itemToDelete.name) {
                self.persistence.delete(itemIndexToDelete)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            
            self.present(deleteAlert, animated: true)
        default:
            break
        }
    }
}

extension UIAlertController {
    convenience init(itemName: String, confirmHandler: @escaping () -> Void) {
        self.init(title: "Remove Item", message: "Are you sure you want to remove \(itemName) from your cart?", preferredStyle: .actionSheet)
        
        let confirmAction = UIAlertAction(title: "Confirm", style: .destructive) { _ in
            confirmHandler()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        self.addAction(confirmAction)
        self.addAction(cancelAction)
    }
}
