//  Contact.swift
//  Created by 레옹아범 on 2022/11/18.

protocol ContactInformationProtocol {
    var name: String { get }
    var age: UInt { get }
    var phoneNumber: String { get }
    var fullText: String { get }
}

struct ContactInformation: ContactInformationProtocol {
    let name: String
    let age: UInt
    let phoneNumber: String
    var fullText: String {
        get { return name + " / \(age) / " + phoneNumber }
    }
}
