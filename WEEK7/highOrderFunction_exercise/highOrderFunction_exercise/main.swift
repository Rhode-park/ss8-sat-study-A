//
//  main.swift
//  highOrderFunction_exercise
//
//  Created by Rowan on 2023/02/04.
//

import Foundation

// 실험1
struct Character {
    let fireBall = { () -> Void in
        print("파이어볼! 화르륵 🔥")
    }
    
    let thunderBolt = { () -> Void in
        print("썬더볼트! 파지직 ⚡️")
    }
    
    let createWater = { () -> Void in
        print("크리에이트 워터~ 💦")
    }
    
    let powerSlash = { print("파워슬래시! 콰광 💫") } // 축약형
    
    func tabShiftKey(skill: () -> Void) {
        skill()
    }
}

let rowan: Character = Character()
rowan.tabShiftKey(skill: rowan.fireBall) // 파이어볼! 화르륵 🔥
rowan.tabShiftKey(skill: rowan.createWater) // 크리에이트 워터~ 💦
rowan.tabShiftKey(skill: rowan.thunderBolt) // 썬더볼트! 파지직 ⚡️
rowan.tabShiftKey(skill: rowan.powerSlash) // 파워슬래시! 콰광 💫
rowan.powerSlash() // (클로저 자체를 실행해봄) 파워슬래시! 콰광 💫


// 실험2
let numbers = [1, 2, 3, 4]
let doubledNumbers = numbers.map({ (number) -> Int in
    return number * 2
})

let evenNumbers = numbers.filter({
    return $0 % 2 == 0
})

let sum = numbers.reduce(0, { $0 + $1 })
let evenNumberSum = evenNumbers.reduce(0) { (x, y) -> Int in
    return x + y
}

print(doubledNumbers)
print(evenNumbers)
print(sum)
print(evenNumberSum)

// 실험3
extension Array {
    func myMap<T>(_ closure: (Self.Element) -> T) -> [T] {
        var result: Array<T> = []
        for element in self {
            let transformedElement = closure(element)
            result.append(transformedElement)
        }
        
        return result
    }
    
    func myFilter(_ closure: (Self.Element) -> Bool) -> [Self.Element] {
        var result: Array<Self.Element> = []
        
        for element in self {
            if closure(element) {
                result.append(element)
            }
        }
        
        return result
    }
    
    func myReduce<T>(_ initialValue: T, _ closure: (T, Self.Element) -> T) -> T {
        var result = initialValue
        
        for element in self {
            result = closure(result, element)
        }
        
        return result
    }
}

let myDoubledNumbers = numbers.myMap { $0 * 2 }
let myEvenNumbers = numbers.myFilter { $0 % 2 == 0 }
let mySum = numbers.myReduce(0) { $0 + $1 }

print(myDoubledNumbers)
print(myEvenNumbers)
print(mySum)


precedencegroup CompositionPrecedence {
    
}
