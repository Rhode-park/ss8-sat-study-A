//
//  ShowMenu.swift
//  사전과제SOLID리팩토링
//
//  Created by Jinah Park on 2023/01/28.
//

import Foundation

struct ShowMenu {
    func showMenu() {
        let addAddress = AddAddress()
        let showAddress = ShowAddress()
        let searchAddress = SearchAddress()
        
        print("1) 연락처 추가 2) 연락처 목록보기 3) 연락처 검색 x) 종료")
        print("메뉴를 선택해주세요 : ", terminator: "")
        let menuSelect = readLine()!
        if menuSelect == String(1) {
            addAddress.addAddress()
            print("", terminator: "\n")
            self.showMenu()
        } else if menuSelect == String(2) {
            showAddress.showAddress()
            print("", terminator: "\n")
            self.showMenu()
        } else if menuSelect == String(3) {
            searchAddress.searchAddress()
            print("", terminator: "\n")
            self.showMenu()
        } else if menuSelect == "x" {
            
        } else {
            print("선택이 잘못되었습니다 확인 후 다시 입력해주세요.")
            print("", terminator: "\n")
            self.showMenu()
        }
    }
}
