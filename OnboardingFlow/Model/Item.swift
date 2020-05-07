//
//  Item.swift
//  OnboardingFlow
//
//  Created by Mark Kim on 4/25/20.
//  Copyright © 2020 Mark Kim. All rights reserved.
//

import UIKit

struct Item: Codable {
    
    enum Images: Int, Codable, CaseIterable {
        case pill
        case food
        case drop
        case game
        
        var image: UIImage {
            guard let image = UIImage(named: String(describing: self)) else {
                fatalError("not found")
            }
            return image
        }
    }

    let name: String
    let dateCreated: Date = Date()
    let description: String
    let selectedImage: Item.Images
    var quantity: Int = 1
    
    init(name: String, description: String, image: Item.Images) {
        self.name = name
        self.description = description
        self.selectedImage = image
    }
}
