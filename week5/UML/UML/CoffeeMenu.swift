//
//  CoffeeMenu.swift
//  UML
//
//  Created by 강민수 on 2023/01/21.
//

enum CoffeeMenu {
    case americano
    case latte
    
    var price: Int {
        switch self {
        case .americano:
            return 1500
        case .latte:
            return 1800
        }
    }
}
