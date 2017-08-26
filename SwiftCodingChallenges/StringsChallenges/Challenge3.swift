//
//  Challenge3.swift
//  SwiftCodingChallenges
//
//  Created by Radio Shaolin on 26.08.17.
//  Copyright © 2017 Radio Shaolin. All rights reserved.
//

//  Challenge 3: Do two strings contain the same characters?
//  Difficulty: Easy
//
// Write a function that accepts two String parameters, and returns true if they contain the same characters in any order taking into account letter case.
//

import Foundation

struct Challenge3 {
    
    static func doTwoStringsContainsSameChars(input1: String, input2: String) -> Bool {
        
        let inputArray1 = input1.characters.map({ $0 }).sorted()
        let inputArray2 = input2.characters.map({ $0 }).sorted()
        
        return inputArray1.count == inputArray2.count && inputArray1 == inputArray2
    }
    
}
