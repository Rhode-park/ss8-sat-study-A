//  ContactHandler.swift
//  Created by 레옹아범 on 2022/11/18.

extension String {
    func deleteSpace() -> String {
        let result = self.components(separatedBy: " ").joined()
        
        return result
    }
}

struct ContactHandler {
    var contacts: Contact<ContactInformation>
    let displayHandler: Display
    
    init(contacts: Contact<ContactInformation> = Contact<ContactInformation>(), displayHandler: Display) {
        self.contacts = contacts
        self.displayHandler = displayHandler
    }
}
