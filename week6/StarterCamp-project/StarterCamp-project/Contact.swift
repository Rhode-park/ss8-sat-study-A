//  Address.swift
//  Created by 레옹아범 on 2022/11/18.

import Foundation

class Contact<Information: ContactInformationProtocol> {
    var contactList: Array<Information> = []
    
    func filterContactList(include name: String) throws -> Array<Information> {
        let resultList = self.contactList.filter( { $0.name == name } )
        
        guard resultList.count > 0 else {
            throw SearchError.unlistedName
        }
        return resultList
    }
    
    func append(_ contactInformation: Information) {
        self.contactList.append(contactInformation)
    }
}
