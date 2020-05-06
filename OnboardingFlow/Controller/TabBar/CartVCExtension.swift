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
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartItemCell", for: indexPath)
        cell.textLabel?.text = "\(items[indexPath.row])"
        cell.textLabel?.textColor = UIColor(red: 0/255, green: 62/255, blue: 70/255, alpha: 1.0)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let itemDetailVC = CartItemDetailVC()
//        navigationController?.pushViewController(itemDetailVC, animated: true)
    }
}
