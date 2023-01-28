//  Address.swift
//  Created by 레옹아범 on 2022/11/18.

import Foundation

class Contact {
    var contactList: Array<ContactInformation> = []
    
    func filterContactList(include name: String) throws -> Array<ContactInformation> {
        let resultList = self.contactList.filter( { $0.name == name } )
        
        guard resultList.count > 0 else {
            throw SearchError.unlistedName
        }
        return resultList
    }
    
    func append(_ contactInformation: ContactInformation) {
        self.contactList.append(contactInformation)
    }
}
