//  ContactHandler.swift
//  Created by 레옹아범 on 2022/11/18.

struct ContactHandler {
    func deleteSpace(_ target: String) -> String {
        let result = target.components(separatedBy: " ").joined()
        return result
    }
    
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
        
        let name = self.deleteSpace(informationArray[0])
        let age = UInt(self.deleteSpace(informationArray[1]))
        let phoneNumber = self.deleteSpace(informationArray[2])
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
    
    func displayContactList(of contact: Contact) {
        contact.contactList.sort(by: { $0.name < $1.name } )
        for contact in contact.contactList {
            print("- \(contact.fullText)")
        }
    }
    
    func searchContactInfo(from contact: Contact) {
        print("연락처에서 찾을 이름을 입력해주세요 : ", terminator: "")
        var name: String?
        
        do {
            name = try self.readInput()
            if let nameOfContact = name {
                let filteredList = try contact.filterContactList(include: nameOfContact)
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
                self.searchContactInfo(from: contact)
            default:
                print(error)
            }
        }
    }
    
    func addContactInfo(to contact: Contact) {
        print("연락처 정보를 입력해주세요 : ", terminator: "")
        
        do {
            let contactInformation = try self.verifyContactInfo()
            contact.append(contactInformation)
        } catch {
            switch error {
            case InputError.wrongPhoneNumber:
                print("입력한 연락처정보가 잘못되었습니다. 입력 형식을 확인해주세요.\n")
                addContactInfo(to: contact)
            case InputError.noInput:
                print("아무것도 입력되지 않았습니다. 입력 형식을 확인해주세요.\n")
                addContactInfo(to: contact)
            case InputError.wrongAge:
                print("입력한 나이정보가 잘못되었습니다. 입력 형식을 확인해주세요.\n")
                addContactInfo(to: contact)
            case InputError.wrongInputForm:
                print("입력 형식이 잘못되었습니다. 입력 형식을 확인해주세요.\n")
                addContactInfo(to: contact)
            default:
                print(error)
            }
        }
    }
    
    func displayMenu(for contact: Contact) {
        print("1) 연락처 추가 2) 연락처 목록보기 3) 연락처 검색 x) 종료\n메뉴를 선택해주세요 : ", terminator: "")
        let menu = readLine()
        
        switch menu {
        case "1":
            self.addContactInfo(to: contact)
            displayMenu(for: contact)
        case "2":
            self.displayContactList(of: contact)
            print("")
            displayMenu(for: contact)
        case "3":
            self.searchContactInfo(from: contact)
            print("")
            displayMenu(for: contact)
        case "x":
            print("\n[프로그램 종료]")
        default:
            print("선택이 잘못되었습니다 확인 후 다시 입력해주세요.\n")
            displayMenu(for: contact)
        }
    }
}
