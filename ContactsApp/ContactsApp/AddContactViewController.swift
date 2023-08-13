//
//  addContactViewController.swift
//  ContactsApp
//
//  Created by Majid Pawar on 2023-08-04.
//

import UIKit

class AddContactViewController: UIViewController {
    
    var addName: String = ""
    var addNumber: String = ""
    var addEmail: String = ""
    var addDOB: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func nameField(_ sender: UITextField) {
        addName = sender.text!
    }
    
    @IBAction func numberField(_ sender: UITextField) {
        addNumber = sender.text!
    }
    
    
    @IBAction func emailFIeld(_ sender: UITextField) {
        addEmail = sender.text!
    }
    
    
    @IBAction func DOBField(_ sender: UITextField) {
        addDOB = sender.text!
    }
    
    @IBAction func saveContact(_ sender: UIBarButtonItem) {
        contactList.addContact(Name: addName, Number: addNumber, Email: addEmail, DOB: addDOB)
            
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
