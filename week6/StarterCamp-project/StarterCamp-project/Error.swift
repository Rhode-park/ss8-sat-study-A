//
//  Error.swift
//  Created by 레옹아범 on 2022/11/18.
//

enum SearchError: Error {
    case unlistedName
}

enum InputError: Error {
    case wrongAge
    case wrongPhoneNumber
    case noInput
    case wrongInputForm
}
