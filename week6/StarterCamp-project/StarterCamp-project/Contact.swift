//  Address.swift
//  Created by 레옹아범 on 2022/11/18.

protocol ContactFilterable {
    func filterContactList(inclued name: String) throws -> Array<ContactInformationProtocol>
}

class Contact<Information: ContactInformationProtocol>: ContactFilterable {
    var contactList: Array<Information> = []
    
    func append(_ contactInformation: Information) {
        self.contactList.append(contactInformation)
    }
    
    func filterContactList(inclued name: String) throws -> Array<ContactInformationProtocol> {
        let resultList = self.contactList.filter{ $0.name == name }
        
        guard resultList.count > 0 else {
            throw SearchError.unlistedName
        }
        
        return resultList
    }
}
