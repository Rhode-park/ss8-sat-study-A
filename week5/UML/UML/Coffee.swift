//
//  Coffee.swift
//  UML
//
//  Created by 강민수 on 2023/01/21.
//

class Coffee {
    var kind: CoffeeMenu
    var amount: Int
    
    init(kind: CoffeeMenu, amount: Int = 1) {
        self.kind = kind
        self.amount = amount
    }
}
