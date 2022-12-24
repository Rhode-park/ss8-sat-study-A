//
//  main.swift
//  exerciseXcodeproject
//
//  Created by Rowan on 2022/10/19.
//

import Foundation

//-MARK: 실험 1. 옵셔널 값의 사용
//var productsList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"]
//
//
//
//func printMenuByIfLet() {
//    for count in 0...productsList.count-1 {
//        if let selectedMenu = productsList[count] {
//            print("\(count)번 상품은 \(selectedMenu)입니다.\n")
//        }
//    }
//}
//
//enum MenuError: Error {
//    case outOfBudget
//    case notInMenu
//}
//
//func printMenuByGuardLet() throws {
//    for count in 0...productsList.count-1 {
//        guard let selectedMenu = productsList[count] else {
//            throw MenuError.notInMenu
//        }
//
//        print("\(count)번 상품은 \(selectedMenu)입니다.\n")
//    }
//}
//
//printMenuByIfLet()
//try printMenuByGuardLet()



//-MARK: 실험 2. 예외 상황 처리
enum BuyingError: Error {
    case outOfBudget
    case outOfStock
    case outOfRange
}

var budget: Int = 1000
var productsList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"]
let productsPrice: Int = 1000
var productStock: Dictionary<String, Int> = ["볼펜": 1, "텀블러": 1, "다이어리": 1, "에코백": 1, "머그컵": 1, "후드집업": 1]

func buy(productNumber: Int) throws {
    guard productNumber < 6 else {
        throw BuyingError.outOfRange
    }
    
    guard let selectedItem = productsList[productNumber] else {
        throw BuyingError.outOfStock
    }
    
    print("\(selectedItem)(은/는) 1000원 입니다.\n결제해주세요!")
    
    let payResult = Result { try pay() }
    
    switch payResult {
    case .success:
        print("결제되었습니다. 감사합니다! ^^\n")
        productStock[selectedItem]? -= 1
        
        if productStock[selectedItem] == 0 {
            productsList[productNumber] = nil
        }
    case .failure:
        throw BuyingError.outOfBudget
    }
}

func pay() throws {
    guard budget - productsPrice >= 0 else {
        throw BuyingError.outOfBudget
    }
    
    print("---1000원 지불---")
    budget -= productsPrice
}

func selectItem(productNumber: Int) {
    do {
        try buy(productNumber: productNumber)
    } catch BuyingError.outOfStock {
        print("재고가 부족합니다. 다른 상품을 선택해주세요.\n")
    } catch BuyingError.outOfRange {
        print("메뉴에 없는 번호입니다. 0~5번 까지의 번호를 선택해주세요.\n")
    } catch BuyingError.outOfBudget {
        print("잔액이 부족합니다.\n")
    } catch {
        print(error)
    }
}

selectItem(productNumber: 0)

if let itemStock = productsList[0] {
    print(itemStock)
} else {
    print("nil\n")
}

selectItem(productNumber: 2)
selectItem(productNumber: 1)
selectItem(productNumber: 0)
selectItem(productNumber: 9)
