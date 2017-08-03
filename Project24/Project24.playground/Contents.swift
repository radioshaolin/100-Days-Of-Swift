//: Playground - noun: a place where people can play

import UIKit

var myInt = 0

extension Int {
    func addOne() -> Int {
        return self + 1
    }
    
    mutating func plusOne() {
        self += 1
    }
}

extension BinaryInteger {
    func squared() -> Self {
        return self * self
    }
}

myInt.addOne()

5.addOne()
myInt.plusOne()
myInt

print (8.squared())
