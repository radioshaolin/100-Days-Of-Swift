//
//  DetailedVCTextField.swift
//  Homepwner
//
//  Created by Radio Shaolin on 08.08.17.
//  Copyright © 2017 Radio Shaolin. All rights reserved.
//

import UIKit

class DetailTextField: UITextField {

    override func becomeFirstResponder() -> Bool {
        borderStyle = .none
        super.becomeFirstResponder()
        return true
    }
    
    override func resignFirstResponder() -> Bool {
        borderStyle = .roundedRect
        super.resignFirstResponder()
        return true
    }
}
