//
//  Member.swift
//  JsonExample
//
//  Created by 강민수 on 2023/02/25.
//

import Foundation

struct Member: Codable {
    let nickName: String
    let ss: Int
    let phoneInfo: String
    
    enum CodingKeys: String, CodingKey {
        case nickName = "nick_name"
        case ss
        case phoneInfo = "phone_info"
    }
}
