//
//  PersistenceLayer.swift
//  OnboardingFlow
//
//  Created by Mark Kim on 5/6/20.
//  Copyright © 2020 Mark Kim. All rights reserved.
//

import UIKit

struct PersistenceLayer {
    
    private(set) var items: [Item] = []
    private static let userDefaultItemsKeyValue = "ITEMS_ARRAY"
    
    init() {
        self.loadItems()
    }
    
    private mutating func loadItems() {
        let userDefaults = UserDefaults.standard
        
        guard
            let itemData = userDefaults.data(forKey: PersistenceLayer.userDefaultItemsKeyValue),
            let items = try? JSONDecoder().decode([Item].self, from: itemData) else { return }
        self.items = items
    }
    
    @discardableResult mutating func createNewItem(name: String, description: String, image: Item.Images) -> Item {
        let newItem = Item(name: name, description: description, image: image)
        self.items.insert(newItem, at: 0)
        self.saveItems()
        
        return newItem
    }
    
    func saveItems() {
        guard let itemsData = try? JSONEncoder().encode(self.items) else {
            fatalError("can't encode items")
        }
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(itemsData, forKey: PersistenceLayer.userDefaultItemsKeyValue)
        userDefaults.synchronize()
    }
    
    mutating func delete(_ itemIndex: Int) {
        self.items.remove(at: itemIndex)
        self.saveItems()
    }
    
    mutating func setNeedsToReloadItems() {
        self.loadItems()
    }
    
}
