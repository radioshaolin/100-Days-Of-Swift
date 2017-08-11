//
//  Line.swift
//  TouchTracker
//
//  Created by Radio Shaolin on 10.08.17.
//  Copyright © 2017 Radio Shaolin. All rights reserved.
//

import Foundation
import CoreGraphics

struct Line {
    var begin = CGPoint.zero
    var end = CGPoint.zero
    
    var angle: Measurement<UnitAngle> {
        var angleInRads: Measurement<UnitAngle>
        angleInRads = Measurement(value: -atan2(Double(end.y - begin.y),Double(end.x - begin.x)), unit: .radians)
        
        return angleInRads.converted(to: .degrees)
    }
    
}
