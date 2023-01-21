//
//  main.swift
//  week5
//
//  Created by kokkilE on 2023/01/21.
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
        guard money >= menu.price else {
            print("잔액이 부족합니다.")
            return
        }
    
        money -= menu.price
        coffee = shop.order(menu)
        print("\(name)이(가) \(menu)구입 성공! 잔액: \(money)")
        print("==============================")
    }
}

class CafeManager: Person {
    func brew(_ menu: CoffeeMenu) -> Coffee {
        print("\(name)이(가) \(menu)을(를) 만듭니다.")
        
        return Coffee(menu)
    }
}

class CoffeeShop {
    var manager: CafeManager
    
    init(manager: CafeManager) {
        self.manager = manager
    }
    
    func order(_ menu: CoffeeMenu) -> Coffee {
        print("주문 접수: \(manager.name)매니저님. \(menu) 주문입니다.")
        
        return manager.brew(menu)
    }
}

class Coffee {
    var kind: CoffeeMenu
    var amount: Int
    
    init(_ kind: CoffeeMenu) {
        self.kind = kind
        self.amount = 1 // what?
    }
}

enum CoffeeMenu {
    case americano
    case latte
    
    var price: Int {
        switch self {
        case .americano:
            return 4000
        case .latte:
            return 4500
        }
    }
}

let leonFather = Person(name: "레옹아범", money: 5000)
let rowan = CafeManager(name: "로완", money: 0)
let rhodeBucks = CoffeeShop(manager: rowan)

leonFather.buy(CoffeeMenu.americano, at: rhodeBucks)
leonFather.buy(CoffeeMenu.americano, at: rhodeBucks)
leonFather.buy(CoffeeMenu.americano, at: rhodeBucks)
