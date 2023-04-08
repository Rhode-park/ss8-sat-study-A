//
//  KeychainError.swift
//  KeyChain_Practice
//
//  Created by Jinah Park on 2023/04/08.
//

import Foundation

enum KeychainError: Error {
case noPassword
case duplicateItem
case unexpectedPasswordData
case unhandledError(status: OSStatus)
}
