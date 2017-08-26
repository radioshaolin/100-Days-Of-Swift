//
//  Challenge2.swift
//  SwiftCodingChallenges
//
//  Created by Radio Shaolin on 24.08.17.
//  Copyright © 2017 Radio Shaolin. All rights reserved.
//

//
//  Challenge 2: Is a string a palindrome?
//  Difficulty: Easy
//
//  Write a function that accepts a String as its only parameter, and returns true if the string reads the same when reversed, ignoring case.
//

import Foundation

struct Challenge2 {
    
    static func isStringAPalindrome(input: String) -> Bool {
        let lowercasedInput = input.lowercased()
        return lowercasedInput.reversed() == lowercasedInput.characters.map { $0 }
    }
    
//    static func isStringAPalindrome(input: String) -> Bool {
//        let inputArray = input.characters.map(String.init).map { $0.lowercased() }
//        let reversedInputArray = inputArray.reversed().map { $0 }
//
//
//        for (index, char) in inputArray.enumerated() {
//            if char != reversedInputArray[index] {
//                return false
//            }
//        }
//        return true
//    }
    
}
