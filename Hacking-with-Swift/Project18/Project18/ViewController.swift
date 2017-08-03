//
//  ViewController.swift
//  Project18
//
//  Created by Radio Shaolin on 01.06.17.
//  Copyright © 2017 Radio Shaolin. All rights reserved.
//

import UIKit
import iAd

class ViewController: UIViewController, ADBannerViewDelegate {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("I'm inside the viewDidLoad() method!")
        print(1, 2, 3, 4, 5, separator: "-")
        
        assert(1 == 2, "Maths failure!")
        
      
        for i in 1 ... 100 {
            print("Got number \(i)")
        }

    }

    

}

