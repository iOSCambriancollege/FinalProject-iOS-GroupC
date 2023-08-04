//
//  Contacts.swift
//  ContactsApp
//
//  Created by Majid Pawar on 2023-08-04.
//

import Foundation

class Contacts: Codable {
    var contacts: [Contact]
}

class Contact: Codable {
    var Name: String
    var Number: String
    var Email: String
    var Image: Data?
    
    init(Name: String, Number: String, Email: String) {
        self.Name = Name
        self.Number = Number
        self.Email = Email
    }

}
