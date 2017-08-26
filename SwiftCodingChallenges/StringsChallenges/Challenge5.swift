//
//  Challenge5.swift
//  SwiftCodingChallenges
//
//  Created by Radio Shaolin on 26.08.17.
//  Copyright © 2017 Radio Shaolin. All rights reserved.
//

//
//Challenge 5: Count the characters
//Difficulty: Easy
//
//Write a function that accepts a string, and returns how many times a specific character appears, taking case into account.
//
//Tip: If you can solve this without using a for-in loop, you can consider it a Tricky challenge.


import Foundation

extension String {
    
    func countTheCharacters(_ input: String) -> Int {

        return self.characters.reduce(0) { count, charInString in charInString == Character(input) ? count + 1 : count }
    }

//    func countTheCharacters(_ input: String) -> Int {
//        var counter = 0
    //        for char in self.characters.map { String($0) } where char == input {
//            counter += 1
//        }
//
//        return counter
//    }

//    func countTheCharacters(_ input: String) -> Int {
//        var dictOfCharacters = self.characters.reduce(into: [:]) { counts, letter in counts[letter, default: 0] += 1 }
//
//        return dictOfCharacters[Character(input)] ?? 0
//    }
//
}


