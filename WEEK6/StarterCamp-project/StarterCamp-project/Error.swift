//
//  Error.swift
//  StarterCamp-project
//
//  Created by 김경준 on 2022/11/18.
//

import Foundation

enum SearchError: Error {
    case unlistedName
}

enum InputError: Error {
    case wrongAge
    case wrongPhoneNumber
    case noInput
    case wrongInputForm
}
