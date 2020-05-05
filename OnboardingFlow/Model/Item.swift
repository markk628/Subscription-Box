//
//  Item.swift
//  OnboardingFlow
//
//  Created by Mark Kim on 4/25/20.
//  Copyright © 2020 Mark Kim. All rights reserved.
//

import UIKit

struct Item {
    
    enum Images: Int {
        case pill
        case food
        case game
        
        var image: UIImage {
            guard let image = UIImage(named: String(describing: self)) else {
                fatalError("not found")
            }
            return image
        }
    }

    let name: String
    let dateeCreated: Date = Date()
    let description: String
    let image: UIImage
    var quantity: Int = 1
    
}
