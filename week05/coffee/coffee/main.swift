//
//  main.swift
//  coffee
//
//  Created by Jinah Park on 2023/01/21.
//

import Foundation

class Person {
    var name: String
    var money: Int
    var coffee: Coffee?
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    func buy(_ menu: CoffeeMenu, at shop: CoffeeShop) {
        if money >= menu.price {
            let coffee = shop.order(menu)
            money -= menu.price
            print("맛있는 \(coffee) 냠냠")
            print("잔액이 \(money)원 남았습니다.")
        } else {
            print("잔액이 부족합니다.")
        }
    }
}

class Coffee {
    var kind: CoffeeMenu
    var amount: Int
    
    init(kind: CoffeeMenu, amount: Int) {
        self.kind = kind
        self.amount = amount
    }
}

enum CoffeeMenu {
    case americano
    case latte
    
    var price: Int {
        switch self {
        case .americano:
            return 4100
        case .latte:
            return 4600
        }
    }
}

class CoffeeShop {
    var manager: CafeManager
    
    init(manager: CafeManager) {
        self.manager = manager
    }
    func order(_ menu: CoffeeMenu) -> CoffeeMenu {
        print("\(manager.name)매니저님 \(menu) 주문 들어왔습니다.")
        let coffee = manager.brew(menu)
        print("주문하신 \(coffee) 나왔습니다.")
        return coffee
    }
}

class CafeManager: Person {
    func brew(_ menu: CoffeeMenu) -> CoffeeMenu {
        print("\(name)이 \(menu)를 만드는 중입니다.")
        return menu
    }
}

let hodoo: Person = (.init(name: "Hodoo", money: 10000))
let Rhode: CafeManager = (.init(name: "Rhode", money: 10000))
let starbucks: CoffeeShop = (.init(manager: Rhode))
hodoo.buy(.americano, at: starbucks)
