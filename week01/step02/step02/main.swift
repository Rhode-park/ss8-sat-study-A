//
//  main.swift
//  step02
//
//  Created by Jinah Park on 2022/12/24.
//

import Foundation

//공부 전 풀이
//var budget: Int = 2000
//var productsList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"]
//
//func buy(productNumber: Int) {
//    let price: Int = 1000
//
//    print("선택한 상품 번호는 \(productNumber)입니다.")
//    if productNumber<0 || productNumber>5 {
//        print("존재하지 않는 상품입니다.")
//    } else {
//        if let selectedProduct = productsList[productNumber] {
//            if budget >= price {
//                print("\(selectedProduct)를 구매하셨습니다.")
//                print("\(price)원을 지불합니다.")
//                budget -= price
//                print("남은 예산은 \(budget)원 입니다.")
//                productsList[productNumber] = nil
//            } else {
//                print("잔액이 부족합니다.")
//            }
//        } else {
//            print("품절 된 상품입니다.")
//        }
//    }
// print("")
//}


//공부 후 풀이

buy(productNumber: 1)
buy(productNumber: 1)
buy(productNumber: 2)
buy(productNumber: 3)
buy(productNumber: 10)
