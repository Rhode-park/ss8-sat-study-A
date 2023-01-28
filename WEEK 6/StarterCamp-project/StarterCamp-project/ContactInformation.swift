//
//  Contact.swift
//  StarterCamp-project
//
//  Created by 김경준 on 2022/11/18.
//

import Foundation

struct ContactInformation {
    let name: String
    let age: UInt
    let phoneNumber: String
    var fullText: String {
        get { return name + " / \(age) / " + phoneNumber }
    }
}
