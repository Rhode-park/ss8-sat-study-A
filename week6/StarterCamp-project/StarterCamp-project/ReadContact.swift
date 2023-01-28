//  ReadContact.swift
//  Created by 레옹아범 on 2023/01/28.

protocol Readable {
    func readInput() throws -> String
}

protocol Verifiable {
    func verifyContactInfo() throws -> ContactInformation
}

class ReadContact: Readable, Verifiable {
    func readInput() throws -> String {
        guard let input = readLine(), input != "" else {
            throw InputError.noInput
        }
        return input
    }
    
    func verifyContactInfo() throws -> ContactInformation {
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
