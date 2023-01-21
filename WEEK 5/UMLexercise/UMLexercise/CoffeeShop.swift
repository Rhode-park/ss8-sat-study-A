//
//  CoffeeShop.swift
//  UMLexercise
//
//  Created by Rowan on 2023/01/21.
//

import Foundation

enum CoffeeMenu {
    case americano
    case latte
    
    var price: Int {
        switch self {
        case .americano:
            return 4000
        case .latte:
            return 4800
        }
    }
}

class Coffee {
    let kind: CoffeeMenu
    var amount: Int = 1
    
    init(kind: CoffeeMenu) {
        self.kind = kind
    }
}

class CoffeeShop {
    var manager: CafeManager
    
    init(manager: CafeManager) {
        self.manager = manager
    }
    
    func order(_ menu: CoffeeMenu) -> Coffee {
        print("\(menu) 주문 받았습니다.")
        self.manager.money += menu.price
        
        let orderedCoffee = self.manager.brew(menu)
        
        return orderedCoffee
    }
    
    func checkSales() {
        print("현재 매출: \(self.manager.money)")
    }
}
