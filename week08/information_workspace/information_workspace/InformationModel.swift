//
//  InformationModel.swift
//  information_workspace
//
//  Created by Jinah Park on 2023/02/25.
//

import Foundation
import UIKit

struct InformationModel: Decodable {
    let nickName: String
    let session: Int
    let phoneInformation: String
    
    private enum CodingKeys: String, CodingKey {
        case nickName = "nick_name"
        case session
        case phoneInformation = "phone_information"
    }
}
