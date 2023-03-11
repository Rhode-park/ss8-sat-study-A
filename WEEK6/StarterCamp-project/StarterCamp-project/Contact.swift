//
//  Address.swift
//  StarterCamp-project
//
//  Created by 김경준 on 2022/11/18.
//

import Foundation

class Contact {
    var contactList: Array<ContactInformation> = []
    let contactHandler: ContactHandler
    
    func displayMenu() {
        print("1) 연락처 추가 2) 연락처 목록보기 3) 연락처 검색 x) 종료\n메뉴를 선택해주세요 : ", terminator: "")
        let menu = readLine()
        
        switch menu {
        case "1":
            contactHandler.addContactInfo(to: &contactList)
            displayMenu()
        case "2":
            contactHandler.display(contactList)
            print("")
            displayMenu()
        case "3":
            contactHandler.searchContactInfo(from: contactList)
            print("")
            displayMenu()
        case "x":
            print("\n[프로그램 종료]")
        default:
            print("선택이 잘못되었습니다 확인 후 다시 입력해주세요.\n")
            displayMenu()
        }
    }
    
    init(contactHandler: ContactHandler) {
        self.contactHandler = contactHandler
    }
}
