//  main.swift
//  Created by 레옹아범 on 2022/11/18.

import Foundation

var contacts = Contact<ContactInformation>()
var display = Display(contact: contacts)
var myContactHandler = ContactHandler(displayHandler: display)

myContactHandler.displayHandler.run()
