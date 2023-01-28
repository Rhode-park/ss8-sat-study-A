//
//  main.swift
//  ios-career-8
//
//  Created by kokkilE on 2023/01/28.
//
/*
 기존의 구조
 repeatMenu() -> displayMenu() ->inputProfile
 */
import Foundation

enum InputError: Error {
    case unknown, emptyInput, wrongAge, wrongNumber
}

struct Profile {
    var name: String
    var age: String
    var phone: String
}

class ProfileBook/*: Inputable, Searchable, Displayable*/ {
    var profiles = [Profile]()
    
    func inputProfile() throws {
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
        
        profiles.append(Profile(
            name: splitProfile[0],
            age: splitProfile[1],
            phone: splitProfile[2]))
    }
    
    func searchName(by name: String) -> [Profile] {
        let serchedProfile = profiles.filter { $0.name.contains(name) }
        
        return serchedProfile
    }
    
    func displayProfiles() {
        let profileLists = profiles.sorted { $0.name > $1.name }
        
        for profile in profileLists {
            print("- \(profile.name) / \(profile.age) / \(profile.phone)")
        }
    }
}

struct Menu {
    var profileBook: ProfileBook
    
    func displayMainMenu() {
        print("1) 연락처 추가 2) 연락처 목록보기 3) 연락처 검색 x) 종료")
        print("메뉴를 선택해주세요 : ", terminator: "")
    }
    
    func inputMenuButton() -> String {
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
        
        while true {
            displayMainMenu()
            let inputMenuButton = inputMenuButton()
            
            switch inputMenuButton {
            case "1":
                do {
                    try profileBook.inputProfile()
                } catch InputError.emptyInput {
                    print("아무것도 입력되지 않았습니다. 입력 형식을 확인해주세요.")
                } catch InputError.wrongAge {
                    print("입력한 나이정보가 잘못되었습니다. 입력 형식을 확인해주세요.")
                } catch InputError.wrongNumber {
                    print("입력한 연락처정보가 잘못되었습니다. 입력 형식을 확인해주세요.")
                } catch {}
                
            case "2":
                profileBook.displayProfiles()
                
            case "3":
                
                print("연락처에서 찾을 이름을 입력해주세요 : ", terminator: "")
                if let searchName = readLine() {
                    let searchedProfiles = profileBook.searchName(by: searchName)
                    
                    if searchedProfiles.count == 0 {
                        print("연락처에 \(searchName) 이(가) 없습니다.")
                    } else {
                        for profile in searchedProfiles {
                            print("- \(profile.name) / \(profile.age) / \(profile.phone)")
                        }
                    }
                }
            case "x":
                print("")
                print("[프로그램 종료]")
                return
                
            default:
                print("선택이 잘못되었습니다. 확인 후 다시 입력해주세요.")
            }
            
            print("")
        }
    }
}

var profileBook = ProfileBook()
let menu = Menu(profileBook: profileBook)

menu.repeatMenu()
