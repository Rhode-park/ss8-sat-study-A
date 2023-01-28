//
//  main.swift
//  사전과제SOLID리팩토링
//
//  Created by Jinah Park on 2023/01/28.
//

import Foundation

var addressArray : [[String]] = []

func addAddress() {
    print("연락처 정보를 입력해주세요 : ", terminator: "")
    
    if let address = readLine()?.split(separator: "/").map({ String($0) }) {
        let name = address[0].trimmingCharacters(in: [" "])
        let age = address[1].trimmingCharacters(in: [" "])
        let number = address[2].trimmingCharacters(in: [" "])
        
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
                addAddress()
            }
        } else {
            print("입력한 나이정보가 잘못되었습니다. 입력 형식을 확인해주세요.", terminator: "\n")
            print("", terminator: "\n")
            addAddress()
        }
    } else {
        print("아무것도 입력되지 않았습니다. 입력 형식을 확인해주세요.")
    }
}



func showAddress() {
    if addressArray.count != 0 {
        for i in 0...addressArray.count-1 {
            print("- \(addressArray[i][0]) / \(addressArray[i][1]) / \(addressArray[i][2])", terminator: "\n")
        }
    }
}

func searchAddress() {
    print("연락처에서 찾을 이름을 입력해주세요 : ", terminator: "")
    let searchName = readLine()!
    var count = 0
    if addressArray.count != 0 {
        for i in 0...addressArray.count-1 {
            if addressArray[i][0] == searchName {
                print("- \(addressArray[i][0]) / \(addressArray[i][1]) / \(addressArray[i][2])")
                count += 1
                }
        }
        if count == 0 {
            print("연락처에 \(searchName) 이(가) 없습니다.")
            }
    } else {
        print("연락처에 \(searchName) 이(가) 없습니다.")
    }
    
}


func showMenu() {
    print("1) 연락처 추가 2) 연락처 목록보기 3) 연락처 검색 x) 종료")
    print("메뉴를 선택해주세요 : ", terminator: "")
    let menuSelect = readLine()!
    if menuSelect == String(1) {
        addAddress()
        print("", terminator: "\n")
        showMenu()
    } else if menuSelect == String(2) {
        showAddress()
        print("", terminator: "\n")
        showMenu()
    } else if menuSelect == String(3) {
        searchAddress()
        print("", terminator: "\n")
        showMenu()
    } else if menuSelect == "x" {
        
    } else {
        print("선택이 잘못되었습니다 확인 후 다시 입력해주세요.")
        print("", terminator: "\n")
        showMenu()
    }
}


showMenu()
