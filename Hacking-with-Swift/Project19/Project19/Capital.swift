//
//  Capital.swift
//  Project19
//
//  Created by Radio Shaolin on 01.06.17.
//  Copyright © 2017 Radio Shaolin. All rights reserved.
//

import UIKit
import MapKit

class Capital: NSObject, MKAnnotation {
    var title: String?
    var info: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title: String, coordinate: CLLocationCoordinate2D, info: String) {
        self.title = title
        self.info = info
        self.coordinate = coordinate
    }
}
