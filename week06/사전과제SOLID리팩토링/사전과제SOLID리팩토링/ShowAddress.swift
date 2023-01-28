//
//  ShowAddress.swift
//  사전과제SOLID리팩토링
//
//  Created by Jinah Park on 2023/01/28.
//

import Foundation

struct ShowAddress {
    func showAddress() {
        if addressArray.count != 0 {
            for i in 0...addressArray.count-1 {
                print("- \(addressArray[i][0]) / \(addressArray[i][1]) / \(addressArray[i][2])", terminator: "\n")
            }
        }
    }
}
