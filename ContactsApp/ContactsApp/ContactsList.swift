//
//  ContactsList.swift
//  ContactsApp
//
//  Created by Majid Pawar on 2023-08-04.
//

import Foundation

class ContactsList{
    
    var list = [Contacts]()
    
    private var templates = ["Majid","Vaishnavi","Jayant","Prashant","Pankaj","Bontu"]
    
    init(_ count: Int){
        for _ in 1...count {
            let index = Int.random(in: 0..<templates.count)
            let name = templates[index]
            let newList = Contacts(name: name)
            list.append(newList)
        }
    }
}
