//  Display.swift
//  Created by 레옹아범 on 2023/01/28.

protocol displayContactListProtocol {
    func displayContactList(of contact: Contact<ContactInformation>)
}

protocol displaySearchContactInfoProtocol {
    func searchContactInfo(from contact: Contact<ContactInformation>)
}

protocol displayAddContactInfoProtocol {
    func addContactInfo(to contact: Contact<ContactInformation>)
}

protocol displayMenuProtocol {
    func displayMenu(for contact: Contact<ContactInformation>)
}

final class Display: displayMenuProtocol, displayAddContactInfoProtocol, displayContactListProtocol {
    private var contact: Contact<ContactInformation>
    private let readingHandler: ReadContact
    
    init(contact: Contact<ContactInformation>) {
        self.contact = contact
        readingHandler = ReadContact()
    }
    
    func run() {
        self.displayMenu(for: self.contact)
    }
    
    func displayMenu(for contact: Contact<ContactInformation>) {
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
    
    func addContactInfo(to contact: Contact<ContactInformation>) {
        print("연락처 정보를 입력해주세요 : ", terminator: "")
        
        do {
            let contactInformation = try readingHandler.verifyContactInfo()
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
    
    private func searchContactInfo(from contact: Contact<ContactInformation>) {
        print("연락처에서 찾을 이름을 입력해주세요 : ", terminator: "")
        var name: String?

        do {
            name = try readingHandler.readInput()
            if let nameOfContact = name {
                let filteredList = try contact.filterContactList(inclued: nameOfContact)
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
    
    func displayContactList(of contact: Contact<ContactInformation>) {
        contact.contactList.sort(by: { $0.name < $1.name } )
        for contact in contact.contactList {
            print("- \(contact.fullText)")
        }
    }
}
