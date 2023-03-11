//
//  main.swift
//  UMLexercise
//
//  Created by Rowan on 2023/01/21.
//

import Foundation

var yagom: Person = Person(name: "야-곰", money: 2500)
var rowan: CafeManager = CafeManager(name: "로완", money: 0)
var kokkile: Person = Person(name: "코낄이", money: 1000000)
var leonfather: Person = Person(name: "레옹아범", money: 555555)
let rowanbucks: CoffeeShop = CoffeeShop(manager: rowan)

yagom.buy(.latte, at: rowanbucks)

kokkile.buy(.latte, at: rowanbucks)

leonfather.buy(.americano, at: rowanbucks)
leonfather.buy(.americano, at: rowanbucks)

print("레옹아범의 생명수 섭취량은 \(String(describing: leonfather.coffee!.amount))!!\n")

rowanbucks.checkSales()
rowan.takeSalesInMyPocket()
rowanbucks.checkSales()
