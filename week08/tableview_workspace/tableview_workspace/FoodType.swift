//
//  Menu.swift
//  tableview_workspace
//
//  Created by Jinah Park on 2023/02/25.
//

import Foundation

enum FoodType: String, CaseIterable {
    case American
    case Chinese
    case Korean
    case Japanese
    
//    var detailMenu: [String] {
//        switch self {
//        case .american:
//            return ["햄버거", "피자", "아메리카노"]
//        case .chinese:
//            return ["탕수육"]
//        case .korean:
//            return ["비빔밥", "돼지갈비"]
//        case .japanese:
//            return ["스시", "스윙스(돈까스)"]
//        }
//    }
}

struct Food {
    let name: String
    var price: Int
}
