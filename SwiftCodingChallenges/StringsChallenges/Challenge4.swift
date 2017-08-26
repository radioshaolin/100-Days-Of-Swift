//
//  Challenge4.swift
//  SwiftCodingChallenges
//
//  Created by Radio Shaolin on 26.08.17.
//  Copyright © 2017 Radio Shaolin. All rights reserved.
//

//
//Challenge 4: Does one string contain another?
//Difficulty: Easy
//
//Write your own version of the contains() method on String that ignores letter case, and without using the existing contains() method.
//

import Foundation

extension String {
    
    func fuzzyContains(_ input: String) -> Bool {

        return self.range(of: input, options: .caseInsensitive) != nil
    }
    
//    func fuzzyContains(_ input: String) -> Bool {
//
//            return self.lowercased().range(of: input.lowercased()) != nil
//    }
    
}
