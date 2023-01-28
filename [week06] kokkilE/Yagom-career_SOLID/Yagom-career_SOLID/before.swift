//
//  main.swift
//  ios-career-8
//
//  Created by yagom-academy on 2022/11/16.
//

import Foundation

enum InputError: Error {
    case unknown, emptyInput, wrongAge, wrongNumber
}

func inputProfile() throws -> [String] {
    print("연락처 정보를 입력해주세요 : ", terminator: "")
    
    guard var receivedProfile = readLine() else {
        throw InputError.unknown
    }
    
    receivedProfile = receivedProfile.replacingOccurrences(of: " ", with: "")

    if receivedProfile.isEmpty {
        throw InputError.emptyInput
    }
    
    // split
    let splitProfile = receivedProfile.components(separatedBy: "/")
    
    // validate input Age
    guard let ageStringToInt = Int(splitProfile[1]) else {
        throw InputError.wrongAge
    }
    guard ageStringToInt >= 0 && ageStringToInt < 1000 else {
        throw InputError.wrongAge
    }
    
    // validate input Number
    guard splitProfile[2].filter({ $0 == "-" }).count == 2 &&
            splitProfile[2].count >= 11 else {
        throw InputError.wrongNumber
    }
    
    print("입력한 정보는 \(splitProfile[1])세 \(splitProfile[0])(\(splitProfile[2]))입니다.")
        
    return splitProfile
}

func displayMenu() -> String {
    print("1) 연락처 추가 2) 연락처 목록보기 3) 연락처 검색 x) 종료")
    print("메뉴를 선택해주세요 : ", terminator: "")
    guard let inputMenuButton = readLine() else {
        return "0"
    }
    guard inputMenuButton == "1" ||
            inputMenuButton == "2" ||
            inputMenuButton == "3" ||
            inputMenuButton == "x" else {
        return "0"
    }
    
    return inputMenuButton
}

func repeatMenu() {
    var profileLists = [[String]]()
    var repeatJudge = true
    
    repeat {
        let inputMenuButton = displayMenu()
        
        switch inputMenuButton {
        case "1":
            do {
                try profileLists.append(inputProfile())
            } catch InputError.emptyInput {
                print("아무것도 입력되지 않았습니다. 입력 형식을 확인해주세요.")
            } catch InputError.wrongAge {
                print("입력한 나이정보가 잘못되었습니다. 입력 형식을 확인해주세요.")
            } catch InputError.wrongNumber {
                print("입력한 연락처정보가 잘못되었습니다. 입력 형식을 확인해주세요.")
            } catch {}
            
        case "2":
            profileLists = profileLists.sorted(by: {$0[0] > $1[0]})
            for profile in profileLists {
                print("- \(profile[0]) / \(profile[1]) / \(profile[2])")
            }
            
        case "3":
            print("연락처에서 찾을 이름을 입력해주세요 : ", terminator: "")
            if let searchName = readLine() {
                let searchedProfile = profileLists.filter { $0[0].contains(searchName) }
                
                if searchedProfile.count == 0 {
                    print("연락처에 \(searchName) 이(가) 없습니다.")
                } else {
                    for profile in searchedProfile {
                        print("- \(profile[0]) / \(profile[1]) / \(profile[2])")
                    }
                }
            }
            
        case "x":
            print("")
            print("[프로그램 종료]")
            repeatJudge = false
            
        default:
            print("선택이 잘못되었습니다. 확인 후 다시 입력해주세요.")
        }
        
        print("")
    } while repeatJudge == true
}

repeatMenu()
