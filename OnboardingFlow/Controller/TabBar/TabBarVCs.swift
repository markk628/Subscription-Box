//
//  TabBarVCs.swift
//  OnboardingFlow
//
//  Created by Mark Kim on 4/24/20.
//  Copyright © 2020 Mark Kim. All rights reserved.
//

import UIKit

class TabBarVCs: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        title = "Quarantine Box"
        setUpViewControllers()
        self.delegate = self
    }
    
    private func setUpViewControllers() {
        
        
        var viewControllerArray = [UIViewController]()
        let viewControllerClasses = [HomeVC(), CartVC(), CategoriesVC(), PurchaseHistoryVC(), ProfileVC()]
        let titles = ["Home", "Purchase History", "Categories", "Your Cart", "Profile"]
        let tabBarIcons = [
            UITabBarItem(tabBarSystemItem: .featured, tag: 0),
            UITabBarItem(title: "Your Cart", image: UIImage(named: "cart"), selectedImage: UIImage(named: "cart")),
            UITabBarItem(title: "Categories", image: UIImage(named: "category"), selectedImage: UIImage(named: "category")),
            UITabBarItem(tabBarSystemItem: .history, tag: 0),
            UITabBarItem(title: "Profile", image: UIImage(named: "profile"), selectedImage: UIImage(named: "profile"))
        ]
        
        for i in 0..<viewControllerClasses.count {
            let vc = viewControllerClasses[i]
            vc.title = titles[i]
//            let navigationControllers = UINavigationController(rootViewController: vc)
            vc.tabBarItem = tabBarIcons[i]
            
            self.tabBar.barTintColor = .white
            self.tabBar.tintColor = UIColor(red: 0/255, green: 62/255, blue: 70/255, alpha: 1.0)
            
//            viewControllerArray.append(navigationControllers)
            viewControllerArray.append(vc)

        }
        
        viewControllers = viewControllerArray
    }
    
    private func setUpNavBar() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pressAddItem(_:)))
        navigationItem.rightBarButtonItem = addButton
        navigationItem.leftBarButtonItem = self.editButtonItem
    }
        
     @objc func pressAddItem(_ sender: UIBarButtonItem) {
        let addItemVC = AddItemVC()
        let navigationController = UINavigationController(rootViewController: addItemVC)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true, completion: nil)
     }
     
     @objc func openNextScene(){
        let detailVC = CartItemDetailVC()
         self.navigationController?.pushViewController(detailVC, animated: true)
     }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if(viewController.isKind(of: CartVC.self)){
            setUpNavBar()
        }else{
            navigationItem.rightBarButtonItem = nil
            navigationItem.leftBarButtonItem = nil
        }
    }
        
        
//        let homeVC: HomeVC = {
//            let vc = HomeVC()
//            vc.title = "Home"
//            vc.view.backgroundColor = .white
//            vc.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 0)
//            vc.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -3, right: 0)
//            return vc
//        }()
//
//        let purchaseHistoryVC: PurchaseHistoryVC = {
//            let vc = PurchaseHistoryVC()
//            vc.title = "Purchase History"
//            vc.view.backgroundColor = .white
//            vc.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 0)
//            vc.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -3, right: 0)
//            return vc
//        }()
//
//        let categoriesVC: CategoriesVC = {
//            let vc = CategoriesVC()
//            vc.title = "Categories"
//            vc.view.backgroundColor = .white
//            vc.tabBarItem = UITabBarItem(title: vc.title, image: UIImage(named: "category"), selectedImage: UIImage(named: "category"))
//            vc.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -3, right: 0)
//            return vc
//        }()
//
//
////        let home = UINavigationController(rootViewController: homeVC)
////        let purchaseHistory = UINavigationController(rootViewController: purchaseHistoryVC)
//
////        viewControllers = [home, purchaseHistory]
//        viewControllers = [homeVC, purchaseHistoryVC, categoriesVC]
//
}
