//
//  main.swift
//  UML
//
//  Created by 강민수 on 2023/01/21.
//

let leon = CafeManager(name: "레옹", money: 1000000)
let compose = CoffeeShop(manager: leon)

let customer = Person(name: "손놈", money: 0)
let king = Person(name: "왕", money: 20000)

customer.buy(.latte, at: compose)
customer.buy(.americano, at: compose)

king.buy(.americano, at: compose)
king.buy(.latte, at: compose)

print(compose.manager.money)
print(king.coffee?.kind)
