//
//  Person.swift
//  UML
//
//  Created by 강민수 on 2023/01/21.
//

class Person {
    var name: String
    var money: Int
    var coffee: Coffee?
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    func buy(_ menu: CoffeeMenu, at shop: CoffeeShop) {
        if menu.price <= self.money {
            self.coffee = shop.order(menu)
        } else {
            print("잔액이 부족합니다")
        }
    }
}
