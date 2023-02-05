//
//  main.swift
//  고차함수
//
//  Created by Jinah Park on 2023/02/05.
//
import Foundation

//MARK: 실험1
print("실험1")
//캐릭터 클래스를 상속해 여러 캐릭터를 만들 수 있도록 class 타입으로 만든다
class Character {
    let magicClaw: () -> Void = {
        print("magicClaw")
    }
    let fireBall: () -> Void = {
        print("fireBall")
    }
    let thunderBolt: () -> Void = {
        print("thunderBolt")
    }
    
    //클로저에 skill이라는 이름을 붙여줌
    func tabShiftKey(skill: () -> Void) {
        skill()
    }
}

let rhode: Character = Character()
rhode.tabShiftKey(skill: rhode.magicClaw)
rhode.tabShiftKey(skill: rhode.fireBall)
rhode.tabShiftKey(skill: rhode.thunderBolt)

//MARK: 실험2
print("실험2")
let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

//map
let doubledNumber = numbers.map { number in
    return number * 2
}
print("map의 사용 결과: \(doubledNumber)")

//filter
let oddNumber = numbers.filter { number in
    return number % 2 == 1
}
print("filter의 사용 결과: \(oddNumber)")

//reduce
let sum = numbers.reduce(0, {(x, y) -> Int in
    return x + y
})
print("reduce의 사용 결과: \(sum)")

let multiple = numbers.reduce(1, {(x, y) -> Int in
    return x * y
})
print("reduce의 사용 결과: \(multiple)")

/*
 - map: 일대일 대응으로 갖다놓는 함수
 - filter: 내부의 값을 조건(클로저)에 맞게 걸러주는 함수
 - reduce: 내부의 콘텐츠를 (클로저에 따라) 하나로 통합하는 함수
 */


//MARK: 실험3
print("실험3")
extension Array {
    func myMap<T>(_ transform: (Self.Element) throws -> T) rethrows -> [T] {
        var result: [T] = []
        for data in self {
            result.append(try transform(data))
        }
        return result
    }
    
    func myFilter(_ isIncluded: (Self.Element) throws -> Bool) rethrows -> [Self.Element] {
        var result: [Element] = []
        for data in self {
            if try isIncluded(data) {
                result.append(data)
            }
        }
        return result
    }
    
    func myReduce<T>(_ initialResult: T, _ nextPartialResult: (T, Self.Element) throws -> T) rethrows -> T {
        var result = initialResult
        for data in self {
            result = try nextPartialResult(result, data)
        }
        return result
    }
}

let abc = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

let mapAbc = abc.myMap { $0 * 2 }
print("myMap의 사용 결과: \(mapAbc)")

let filterAbc = abc.myFilter { $0 % 2 == 1 }
print("myFilter의 사용 결과: \(filterAbc)")

let reduceAbc1 = abc.myReduce(0, { $0 + $1 })
print("myReduce의 사용 결과: \(reduceAbc1)")

let reduceAbc2 = abc.myReduce(1, { $0 * $1 })
print("myReduce의 사용 결과: \(reduceAbc2)")

let abe = ["a", "b", "c", "d"]
let reduceAbe = abe.myReduce("", { $0 + $1 })
print("myReduce의 사용 결과: \(reduceAbe)")
