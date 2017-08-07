//
//  ItemStore.swift
//  Homepwner
//
//  Created by Radio Shaolin on 06.08.17.
//  Copyright © 2017 Radio Shaolin. All rights reserved.
//

import UIKit

class ItemStore {
    
    var allItems = [Item]()
    
    var highValueItems: [Item] {
        return allItems.filter{ $0.valueInDollars > 50 }
    }
    
    var otherItems: [Item] {
        return allItems.filter{ $0.valueInDollars <= 50 }
    }
    
    
    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        
        return newItem
    }
    
    init() {
        for _ in 0..<5 {
            createItem()
        }
    }
}

