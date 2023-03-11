//
//  FoodType.swift
//  TableViewExercise
//
//  Created by Rowan on 2023/02/25.
//

enum FoodType: String, CaseIterable {
    case American
    case Chinese
    case Korean
    case Japanese
}

struct Food {
    let name: String
    var price: Int
}

