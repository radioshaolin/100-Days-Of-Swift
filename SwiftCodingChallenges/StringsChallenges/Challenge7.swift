//
//  Challenge7.swift
//  SwiftCodingChallenges
//
//  Created by Radio Shaolin on 27.08.17.
//  Copyright © 2017 Radio Shaolin. All rights reserved.
//

//
//  Challenge 7: Condense whitespace
//  Difficulty: Easy
//
//  Write a function that returns a string with any consecutive spaces replaced with a single space.
//

import Foundation

struct Challenge7 {
    
    
    static func condenseWhitespaces(_ input: String) -> String {

        return input.replacingOccurrences(of: " +", with: " ", options: .regularExpression, range: nil)
    }
    
    
//    static func condenseWhitespaces(_ input: String) -> String {
//
//        var seenWhiteSpace = false
//        var result = ""
//
//        for char in input.characters {
//            if char == " " {
//                if seenWhiteSpace == true { continue }
//                seenWhiteSpace = true
//                result.append(char)
//            } else {
//                result.append(char)
//                seenWhiteSpace = false
//            }
//        }
//
//        return result
//    }
    
    
//    static func condenseWhitespaces(_ input: String) -> String {
//        
//        let components = input.components(separatedBy: .whitespacesAndNewlines)
    
//        return components.filter({ !$0.isEmpty }).joined(separator: " ")
//    }
}

