//  Contact.swift
//  Created by 레옹아범 on 2022/11/18.

struct ContactInformation {
    let name: String
    let age: UInt
    let phoneNumber: String
    var fullText: String {
        get { return name + " / \(age) / " + phoneNumber }
    }
}
