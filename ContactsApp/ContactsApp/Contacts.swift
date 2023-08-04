//
//  Contacts.swift
//  ContactsApp
//
//  Created by Majid Pawar on 2023-08-04.
//

import Foundation

class Contacts{
    var name: String
    var phone: String?
    var email: String?
    var image: Data?
    
    init(name: String) {
        self.name = name
    }
    func setImage(_ image: Data){
        self.image = image
    }
}
