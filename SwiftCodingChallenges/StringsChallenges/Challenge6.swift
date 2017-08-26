//
//  Challenge6.swift
//  SwiftCodingChallenges
//
//  Created by Radio Shaolin on 26.08.17.
//  Copyright © 2017 Radio Shaolin. All rights reserved.
//


//
//  Challenge 6: Remove duplicate letters from a string
//  Difficulty: Easy
//
// Write a function that accepts a string as its input, and returns the same string just with duplicate letters removed.
//
//  Tip: If you can solve this challenge without a for-in loop, you can consider it “tricky” rather than “easy”.
//

import Foundation

struct Challenge6 {
    
    static func removeDuplicateLetters(from input: String) -> String {

        let orderedSetOfCharacters = NSOrderedSet(array: Array(input.characters))

        return orderedSetOfCharacters.array.reduce("") { $0 + String(describing: $1) }
    }
    
    
//    static func removeDuplicateLetters(from input: String) -> String {
//
//        let arrayOfStrings = input.characters.map { String($0) }
//        let orderedSet = NSOrderedSet(array: arrayOfStrings)
//        let sortedArrayOfSyrings = Array(orderedSet) as? Array<String>
//
//        return sortedArrayOfSyrings?.joined() ?? ""
//    }
    
    
//    static func removeDuplicateLetters(from input: String) -> String {
//
//        var used = [Character: Bool]()
//        let result = input.characters.filter { used.updateValue(true, forKey: $0) == nil }
//
//        return String(result)
//
//    }
    
    
    
  

    
    

}
