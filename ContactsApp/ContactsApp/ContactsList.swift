//
//  ContactsList.swift
//  ContactsApp
//
//  Created by Majid Pawar on 2023-08-04.
//

import Foundation

class ContactsList{
    
    var contacts = [Contact]()
    
    // Do not modify this init method. it is used to add default movies to your movies array
    init(){
        if let url = Bundle.main.url(forResource: "UserContacts", withExtension: "json"){
            do {
                
                let data = try Data(contentsOf: url)

                let decoder = JSONDecoder()
                
                let results = try decoder.decode(Contacts.self, from: data)
                
                contacts = results.contacts
                                
            } catch {
                   fatalError("cannot convert JSON to contacts: \(error)")
            }
        } else {
            print("something went wrong when geting url")
        }
    }
    
    func addContact(Name: String, Number: String, Email: String, DOB: String){
        self.contacts.append(Contact(Name: Name, Number: Number, Email: Email, DOB: DOB))
    }
}
