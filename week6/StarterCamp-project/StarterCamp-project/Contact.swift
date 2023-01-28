//  Address.swift
//  Created by 레옹아범 on 2022/11/18.

protocol ContactFilterable {
    func filterContactList(inclue name: String, by contacts: Array<ContactInformationProtocol>) throws -> Array<ContactInformationProtocol>
}

class Contact<Information: ContactInformationProtocol> {
    var contactList: Array<Information> = []
    var contactFilter = ContactFilter()
    
    func append(_ contactInformation: Information) {
        self.contactList.append(contactInformation)
    }
}

class ContactFilter: ContactFilterable {
    func filterContactList(inclue name: String, by contacts: Array<ContactInformationProtocol>) throws -> Array<ContactInformationProtocol> {
        let resultList = contacts.filter{ $0.name == name }
        
        guard resultList.count > 0 else {
            throw SearchError.unlistedName
        }
        
        return resultList
    }
}
