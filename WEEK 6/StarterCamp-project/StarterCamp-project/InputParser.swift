//
//  InputParser.swift
//  StarterCamp-project
//
//  Created by Rowan on 2023/01/28.
//

import Foundation

extension String {
    func deleteSpace() -> String {
        let result = self.components(separatedBy: " ").joined()
        return result
    }
}

enum InputPaser {
    static func readInput() throws -> String {
        guard let input = readLine(), input != "" else {
            throw InputError.noInput
        }
        return input
    }
    
    static func verifyContactInfo() throws -> ContactInformation {
        let information = try self.readInput()
        
        var informationArray: Array<String>
        informationArray = information.components(separatedBy: "/")
        
        guard informationArray.count > 2 else {
            throw InputError.wrongInputForm
        }
        
        let name = informationArray[0].deleteSpace()
        let age = UInt(informationArray[1].deleteSpace())
        let phoneNumber = informationArray[2].deleteSpace()
        let phoneNumberParts = phoneNumber.components(separatedBy: "-")
        let numbers = phoneNumberParts.joined().indices
        
        guard let age = age, age != 0, age < 1000 else {
            throw InputError.wrongAge
        }
        guard phoneNumberParts.count == 3 else {
            throw InputError.wrongPhoneNumber
        }
        guard numbers.count >= 9 else {
            throw InputError.wrongPhoneNumber
        }
        
        let contactInfo = ContactInformation(name: name, age: age, phoneNumber: phoneNumber)
        print("입력한 정보는 \(age)세 \(name)(\(phoneNumber))입니다.\n")
        
        return contactInfo
    }
}
