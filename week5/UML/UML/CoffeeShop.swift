//
//  CoffeeShop.swift
//  UML
//
//  Created by 강민수 on 2023/01/21.
//

class CoffeeShop {
    var manager: CafeManager
    
    init(manager: CafeManager) {
        self.manager = manager
    }
    
    func order(_ menu: CoffeeMenu) -> Coffee {
        let coffee = self.manager.brew(menu)
        
        return coffee
    }
}
