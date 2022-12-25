//
//  main.swift
//  step02
//
//  Created by Jinah Park on 2022/12/24.
//

import Foundation

//MARK: - 공부 전 풀이
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

//MARK: - 공부 후 풀이

var budget: Int = 3000
var productsList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"]
let lastIndexOfProductList = productsList.count - 1
let price = [300, 1000, 500, 1000, 500, 1200]

enum ErrorMessage: String, Error {
    case outOfRange = "상품 번호를 확인하세요. \n"
    case outOfProduct = "해당 상품의 재고가 없습니다. \n"
    case outOfMoney = "예산이 부족합니다. \n"
}

//MARK: - Result 사용

func buy(productNumber: Int) -> Result<String, ErrorMessage> {
    guard productNumber <= lastIndexOfProductList && productNumber>=0 else {
        return .failure(.outOfRange)
        }
    guard let selectedProduct = productsList[productNumber] else {
        return .failure(.outOfProduct)
        }
    guard budget >= price[productNumber] else {
        return .failure(.outOfMoney)
        }
    return .success(selectedProduct)

}

func order(productNumber: Int) {
    let isOrderable = buy(productNumber: productNumber)
    switch isOrderable {
    case .success(let selectedProduct):
        budget -= price[productNumber]
        print("\(selectedProduct)를 구매하셨습니다.")
        print("예산이 \(price[productNumber])원 차감됩니다.")
        print("남은 잔액은 \(budget)원 입니다.")
        print("")
        productsList[productNumber] = nil
    case .failure(let error):
        print(error.rawValue)
    }
}

order(productNumber: 1)
order(productNumber: 2)
order(productNumber: 9)
order(productNumber: 2)
order(productNumber: 5)
order(productNumber: 4)

//MARK: - throw와 do-catch 사용

//func buy(productNumber: Int) throws {
//    guard productNumber <= lastIndexOfProductList && productNumber>=0 else {
//        throw ErrorMessage.outOfRange
//    }
//    guard let selectedProduct = productsList[productNumber] else {
//        throw ErrorMessage.outOfProduct
//    }
//    guard budget >= price[productNumber] else {
//        throw ErrorMessage.outOfMoney
//    }
//
//    productsList[productNumber] = nil
//    budget -= price[productNumber]
//
//    print("\(selectedProduct)를 구매하셨습니다.")
//    print("예산이 \(price[productNumber])원 차감됩니다.")
//    print("남은 잔액은 \(budget)원 입니다.")
//    print("")
//}
//
//func selectItem(productNumber: Int) {
//    do {
//        try buy(productNumber: productNumber)
//    } catch ErrorMessage.outOfRange {
//        print(ErrorMessage.outOfRange.rawValue)
//    } catch ErrorMessage.outOfProduct {
//        print(ErrorMessage.outOfProduct.rawValue)
//    } catch ErrorMessage.outOfMoney {
//        print(ErrorMessage.outOfMoney.rawValue)
//    } catch {
//        print("unknown error")
//    }
//}
//
//selectItem(productNumber: 1)
//selectItem(productNumber: 2)
//selectItem(productNumber: 9)
//selectItem(productNumber: 2)
//selectItem(productNumber: 5)
//selectItem(productNumber: 4)
