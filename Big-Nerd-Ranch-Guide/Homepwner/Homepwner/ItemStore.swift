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
    
    
    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        
        return newItem
    }
}

