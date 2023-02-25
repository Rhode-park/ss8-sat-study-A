//
//  Menu.swift
//  tableview_workspace
//
//  Created by Jinah Park on 2023/02/25.
//

import Foundation

var menu: [FoodType: [Food]] = [
    .American: [
        Food(name: "햄버거", price: 5000),
        Food(name: "피자", price: 18000),
        Food(name: "아메리카노", price: 41000)
    ],
    .Chinese: [
        Food(name: "탕수육", price: 18000)
    ],
    .Korean: [
        Food(name: "비빔밥", price: 8000),
        Food(name: "돼지갈비", price: 20000)
    ],
    .Japanese: [
        Food(name: "스시", price: 20000),
        Food(name: "스윙스(돈까스)", price: 5000)
    ]
]

