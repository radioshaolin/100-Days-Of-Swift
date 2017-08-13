//
//  TagDataSource.swift
//  Photorama
//
//  Created by Radio Shaolin on 12.08.17.
//  Copyright © 2017 Radio Shaolin. All rights reserved.
//

import UIKit
import CoreData

class TagDataSource: NSObject, UITableViewDataSource {
    
    var tags: [Tag] = []

    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return tags.count
    }

    func tableView(_ tableView: UITableView,
                     cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell",
                                                 for: indexPath)
        
        let tag = tags[indexPath.row]
        cell.textLabel?.text = tag.name
        
        return cell
    }
    
}
