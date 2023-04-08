//
//  KeychainManager.swift
//  KeyChain_Practice
//
//  Created by kokkilE on 2023/04/08.
//

import Foundation

class KeychainManager {
    static let shared = KeychainManager()
    
    private init() { }
    
    func createKeychain(_ credentials: Credentials) throws {
        let account = credentials.username
        let password = credentials.password.data(using: String.Encoding.utf8)!
        let query: [String: Any] = [kSecClass as String: kSecClassGenericPassword,
                                    kSecAttrAccount as String: account,
                                    kSecValueData as String: password]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        guard status != errSecDuplicateItem else {
            throw KeychainError.duplicateError
        }
        guard status == errSecSuccess else {
            throw KeychainError.unhandledError(status: status)
        }
    }
    
    func readKeychain(_ username: String) throws -> String {
        let account = username
        let query: [String: Any] = [kSecClass as String: kSecClassGenericPassword,
                                    kSecMatchLimit as String: kSecMatchLimitOne,
                                    kSecAttrAccount as String: account,
                                    kSecReturnAttributes as String: true,
                                    kSecReturnData as String: true]
        
        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        guard status != errSecItemNotFound else { throw KeychainError.noPassword }
        guard status == errSecSuccess else { throw KeychainError.unhandledError(status: status) }
        
        guard let existingItem = item as? [String : Any],
              let passwordData = existingItem[kSecValueData as String] as? Data,
              let password = String(data: passwordData, encoding: String.Encoding.utf8) else {
            throw KeychainError.unexpectedPasswordData
        }
        
        return password
    }
    
    func updateKeychain(_  credentials: Credentials) throws {
        let account = credentials.username
        let password = credentials.password.data(using: String.Encoding.utf8)!
        
        let query: [String: Any] = [kSecClass as String: kSecClassGenericPassword,
                                    kSecAttrAccount as String: account]
        
        let attributes: [String: Any] = [kSecValueData as String: password]
        
        let status = SecItemUpdate(query as CFDictionary, attributes as CFDictionary)
        guard status != errSecItemNotFound else { throw KeychainError.noPassword }
        guard status == errSecSuccess else { throw KeychainError.unhandledError(status: status) }
    }
}

enum KeychainError: Error {
    case duplicateError
    case noPassword
    case unexpectedPasswordData
    case unhandledError(status: OSStatus)
}
