//
//  Challenge1.swift
//  SwiftCodingChallenges
//
//  Created by Radio Shaolin on 24.08.17.
//  Copyright © 2017 Radio Shaolin. All rights reserved.
//

//
//Challenge 1: Are the letters unique?
//Difficulty: Easy
//
//Write a function that accepts a String as its only parameter, and returns true if the string has only unique letters, taking letter case into account.
//

struct Challenge1 {
    
    
    static func areLettersUnique(input: String) -> Bool {
        return input.characters.count == Set(input.characters).count
    }
    
//    static func areLettersUnique(input: String) -> Bool {
//        var countDictionary = [Character: Int]()
//
//        input.characters.forEach { countDictionary[$0, default:0] += 1 }
//
//        for (_, count) in countDictionary where count > 1 {
//            return false
//        }
//
//        return true
//    }
    
}

