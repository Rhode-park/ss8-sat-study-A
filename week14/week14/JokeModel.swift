//
//  JokeModel.swift
//  week14
//
//  Created by 강민수 on 2023/04/15.
//

import Foundation

struct JokeModel {
    let content: String
    let category: Category
    let id: UUID
    
    enum Category: String {
        case 유행어 = "유행어"
        case 아재개그 = "아재개그"
    }
}
