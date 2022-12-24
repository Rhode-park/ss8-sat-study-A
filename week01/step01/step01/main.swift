//
//  main.swift
//  step01
//
//  Created by Jinah Park on 2022/12/24.
//

import Foundation

var productsList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"]

//강제추출
print("강제추출")
for turn in 0...productsList.count-1 {
    let product = productsList[turn]!
    print("\(turn)번 상품은 \(product)입니다.")
}
print("")

//옵셔널 바인딩 - if let
print("옵셔널 바인딩 - if let")
for turn in 0...productsList.count-1 {
    if let product = productsList[turn] {
        print("\(turn)번 상품은 \(product)입니다.")
    }
}
print("")

//옵셔널 바인딩 - guard let
print("옵셔널 바인딩 - guard let")
for turn in 0...productsList.count-1 {
    guard let product = productsList[turn] else {
        break
    }
    print("\(turn)번 상품은 \(product)입니다.")
}
print("")

//암시적 추출 옵셔널
print("암시적 추출 옵셔널")
print("암시적 추출 옵셔널은 옵셔널을 선언할 때 사용할 수 있는 기능이다. 이미 옵셔널이 선언되어있는 실험1에서는 사용할 수 없다.")
print("")

//옵셔널 체이닝
print("옵셔널 체이닝")
print("옵셔널 체이닝은 바인딩/언랩핑을 하지 않고 옵셔널인 채로 연산을 할 수 있는 기능이다. 그러므로 옵셔널을 떼고 출력을 하는 실험1에는 적절하지 않다.")
print("")

//var products = [1: 10, 2: 20]
//products[1]? += 1
//print(products[1])
//products[3]? += 1
//print(products[3])
//연산을 할 대상이 필요. 체이닝은 연산을 해야하는 것.


//Nil 병합 연산자
print("Nil 병합 연산자")
for turn in 0...productsList.count-1 {
    let defaultValue = ""
    let product = productsList[turn] ?? defaultValue
    print("\(turn)번 상품은 \(product)입니다.")
}


//turn 대신 count


