//
//  StringsChallengesTests.swift
//  StringsChallengesTests
//
//  Created by Radio Shaolin on 24.08.17.
//  Copyright © 2017 Radio Shaolin. All rights reserved.
//

import XCTest
@testable import SwiftCodingChallenges

class Challenge1Tests: XCTestCase {
    
    func testAssertion1() {
        XCTAssert(Challenge1.areLettersUnique(input: "No duplicates") == true, "Challenge 1 failed")
    }
    func testAssertion2() {
        XCTAssert(Challenge1.areLettersUnique(input: "abcdefghijklmnopqrstuvwxyz") == true, "Challenge 1 failed")
    }
    
    func testAssertion3() {
        XCTAssert(Challenge1.areLettersUnique(input: "AaBbCc") == true, "Challenge 1 failed")
    }
    
    func testAssertion4() {
        XCTAssert(Challenge1.areLettersUnique(input: "Hello, world") == false, "Challenge 1 failed")
    }
}
    
class Challenge2Tests: XCTestCase {
    
    func testAssertion1() {
        XCTAssert(Challenge2.isStringAPalindrome(input: "rotator") == true, "Challenge 2 failed")
    }
    func testAssertion2() {
        XCTAssert(Challenge2.isStringAPalindrome(input: "Rats live on no evil star") == true, "Challenge 2 failed")
    }
    
    func testAssertion3() {
        XCTAssert(Challenge2.isStringAPalindrome(input: "Never odd or even") == false, "Challenge 2 failed")
    }
    
    func testAssertion4() {
        XCTAssert(Challenge2.isStringAPalindrome(input: "Hello, world") == false, "Challenge 2 failed")
    }
}

class Challenge3Tests: XCTestCase {
    
    func testAssertion1() {
        XCTAssert(Challenge3.doTwoStringsContainsSameChars(input1: "abca", input2: "abca") == true, "Challenge 3 failed")
    }
    func testAssertion2() {
        XCTAssert(Challenge3.doTwoStringsContainsSameChars(input1: "abc", input2: "cba") == true, "Challenge 3 failed")
    }
    
    func testAssertion3() {
        XCTAssert(Challenge3.doTwoStringsContainsSameChars(input1: " a1 b2", input2: "b 1 a2") == true, "Challenge 3 failed")
    }
    
    func testAssertion4() {
        XCTAssert(Challenge3.doTwoStringsContainsSameChars(input1: "abc", input2: "abca") == false, "Challenge 3 failed")
    }
    
    func testAssertion5() {
        XCTAssert(Challenge3.doTwoStringsContainsSameChars(input1: "abc", input2: "Abc") == false, "Challenge 3 failed")
    }
    
    func testAssertion6() {
        XCTAssert(Challenge3.doTwoStringsContainsSameChars(input1: "abc", input2: "cbAa") == false, "Challenge 3 failed")
    }
}

class Challenge4Tests: XCTestCase {
    
    func testAssertion1() {
        XCTAssert("Hello, world".fuzzyContains("Hello") == true, "Challenge 4 failed")
    }
    func testAssertion2() {
        XCTAssert("Hello, world".fuzzyContains("WORLD") == true, "Challenge 4 failed")
    }
    
    func testAssertion3() {
        XCTAssert("Hello, world".fuzzyContains("Goodbye") == false, "Challenge 4 failed")
    }
}

class Challenge5Tests: XCTestCase {
    
    func testAssertion1() {
        XCTAssert("The rain in Spain".countTheCharacters("a") == 2, "Challenge 5 failed")
    }
    func testAssertion2() {
        XCTAssert("Mississippi".countTheCharacters("i") == 4, "Challenge 5 failed")
    }
    
    func testAssertion3() {
        XCTAssert("Hacking with Swift".countTheCharacters("i") == 3, "Challenge 5 failed")
    }
}

class Challenge6Tests: XCTestCase {
    
    func testAssertion1() {
        XCTAssert(Challenge6.removeDuplicateLetters(from: "wombat") == "wombat", "Challenge 6 failed")
    }
    func testAssertion2() {
        XCTAssert(Challenge6.removeDuplicateLetters(from: "hello") == "helo", "Challenge 6 failed")
    }
    
    func testAssertion3() {
        XCTAssert(Challenge6.removeDuplicateLetters(from: "Mississippi") == "Misp", "Challenge 6 failed")
    }
}

class Challenge7Tests: XCTestCase {
    
    func testAssertion1() {
        XCTAssert(Challenge7.condenseWhitespaces("a   b   c") == "a b c", "Challenge 7 failed")
    }
    func testAssertion2() {
        XCTAssert(Challenge7.condenseWhitespaces("    a") == " a", "Challenge 7 failed")
    }
    
    func testAssertion3() {
        XCTAssert(Challenge7.condenseWhitespaces("abc") == "abc", "Challenge 7 failed")
    }
}













