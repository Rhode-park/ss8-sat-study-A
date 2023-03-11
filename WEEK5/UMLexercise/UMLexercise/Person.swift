//
//  Person.swift
//  UMLexercise
//
//  Created by Rowan on 2023/01/21.
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
        guard menu.price <= self.money else {
            print("\(self.name): 잔액이 부족합니다\n")
            return
        }
        
        print("\(self.name): 맛있는 \(menu) 주세요!")
        self.money -= menu.price
        
        let orderedCoffee = shop.order(menu)
        let kindOfMyCoffee = self.coffee?.kind
        let kindOfOrderedCoffee = orderedCoffee.kind
        
        if kindOfMyCoffee != kindOfOrderedCoffee {
            self.coffee = orderedCoffee
        } else {
            self.coffee?.amount += orderedCoffee.amount
        }
        
        print("\(self.name): 음~~ 맛있다~! ☕️\n")
    }
}

class CafeManager: Person, BadManager {
    func brew(_ menu: CoffeeMenu) -> Coffee {        
        let orderedCoffee = Coffee(kind: menu)
        print("\(self.name): 주문하신 \(menu) 나왔습니다~")
        
        return orderedCoffee
    }
    
    func takeSalesInMyPocket() {
        print("\(self.name): ㅋㅋ 내돈🤪")
        self.money = 0
    }
}

protocol BadManager {
    func takeSalesInMyPocket()
}
