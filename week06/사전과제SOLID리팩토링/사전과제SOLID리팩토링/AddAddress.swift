//
//  AddAddress.swift
//  사전과제SOLID리팩토링
//
//  Created by Jinah Park on 2023/01/28.
//

import Foundation

struct AddAddress {
    func addAddress() {
        print("연락처 정보를 입력해주세요 : ", terminator: "")
        
        if let address = readLine()?.split(separator: "/").map({ String($0) }) {
            let name = address[0].trimmingCharacters(in: [" "])
            let age = address[1].trimmingCharacters(in: [" "])
            let number = address[2].trimmingCharacters(in: [" "])
            
            //열거형으로 빼고 분리
            let numberType = "^([0-9])+-?([0-9])+-?([0-9]).{9,}$"
            let isCorrectNumber = number.range(of: numberType, options: .regularExpression) != nil
            
            let ageType = "^[0-9]{1,3}$"
            let isCorrectAge = age.range(of: ageType, options: .regularExpression) != nil
            
            if isCorrectAge == true {
                if isCorrectNumber == true {
                    addressArray.append([name, age, number])
                    print("입력한 정보는 \(age)세 \(name)(\(number))입니다.", terminator: "\n")
                } else {
                    print("입력한 연락처정보가 잘못되었습니다. 입력 형식을 확인해주세요.", terminator: "\n")
                    print("", terminator: "\n")
                    self.addAddress()
                }
            } else {
                print("입력한 나이정보가 잘못되었습니다. 입력 형식을 확인해주세요.", terminator: "\n")
                print("", terminator: "\n")
                self.addAddress()
            }
        } else {
            print("아무것도 입력되지 않았습니다. 입력 형식을 확인해주세요.")
        }
    }
}
