//
//  SearchAddress.swift
//  사전과제SOLID리팩토링
//
//  Created by Jinah Park on 2023/01/28.
//

import Foundation

struct SearchAddress {
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
}
