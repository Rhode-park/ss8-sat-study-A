//
//  ContactHandler.swift
//  StarterCamp-project
//
//  Created by 김경준 on 2022/11/18.
//

import Foundation

struct ContactHandler {
    func display(_ contactList: Array<ContactInformation>) {
        let sortedList = contactList.sorted(by: { $0.name < $1.name } )
        
        for contact in sortedList {
            print("- \(contact.fullText)")
        }
    }
    
    func searchContactInfo(from contactList: Array<ContactInformation>) {
        print("연락처에서 찾을 이름을 입력해주세요 : ", terminator: "")
        var name: String?
        
        do {
            name = try InputPaser.readInput()
            
            if let nameOfContact = name {
                let filteredList = try self.filterContactList(include: nameOfContact, at: contactList)
                
                for contact in filteredList {
                    print("- \(contact.fullText)")
                }
            }
        } catch {
            switch error {
            case SearchError.unlistedName:
                if let name = name {
                    print("연락처에 \(name) 이(가) 없습니다.")
                }
            case InputError.noInput:
                print("아무것도 입력되지 않았습니다. 입력 형식을 확인해주세요.\n")
                self.searchContactInfo(from: contactList)
            default:
                print(error)
            }
        }
    }
    
    func addContactInfo(to contactList: inout Array<ContactInformation>) {
        print("연락처 정보를 입력해주세요 : ", terminator: "")
        
        do {
            let contactInformation = try InputPaser.verifyContactInfo()
            contactList.append(contactInformation)
        } catch {
            switch error {
            case InputError.wrongPhoneNumber:
                print("입력한 연락처정보가 잘못되었습니다. 입력 형식을 확인해주세요.\n")
                addContactInfo(to: &contactList)
            case InputError.noInput:
                print("아무것도 입력되지 않았습니다. 입력 형식을 확인해주세요.\n")
                addContactInfo(to: &contactList)
            case InputError.wrongAge:
                print("입력한 나이정보가 잘못되었습니다. 입력 형식을 확인해주세요.\n")
                addContactInfo(to: &contactList)
            case InputError.wrongInputForm:
                print("입력 형식이 잘못되었습니다. 입력 형식을 확인해주세요.\n")
                addContactInfo(to: &contactList)
            default:
                print(error)
            }
        }
    }
    
    func filterContactList(include name: String, at list: Array<ContactInformation>) throws -> Array<ContactInformation> {
        let resultList = list.filter( { $0.name == name } )
        
        guard resultList.count > 0 else {
            throw SearchError.unlistedName
        }
        return resultList
    }
}
