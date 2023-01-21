//
//  CafeManager.swift
//  UML
//
//  Created by 강민수 on 2023/01/21.
//

class CafeManager: Person {
    
    func brew(_ menu: CoffeeMenu) -> Coffee {
        self.money += menu.price
        return Coffee(kind: menu)
    }
}
