//
//  ItemCell.swift
//  Homepwner
//
//  Created by Radio Shaolin on 07.08.17.
//  Copyright © 2017 Radio Shaolin. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var serialNumberLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    
    var isUnderFifty: Bool = false {
        didSet {
            valueLabel.textColor = isUnderFifty ? UIColor.green : UIColor.red
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        nameLabel.adjustsFontForContentSizeCategory = true
        serialNumberLabel.adjustsFontForContentSizeCategory = true
        valueLabel.adjustsFontForContentSizeCategory = true
    }
}
