//
//  ContactDetailViewController.swift
//  ContactsApp
//
//  Created by Majid Pawar on 2023-08-04.
//

import UIKit


class ContactDetailViewController: UIViewController {

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var detailDOB: UILabel!
    @IBOutlet weak var detailEmail: UILabel!
    @IBOutlet weak var detailNumber: UILabel!
    @IBOutlet weak var detailName: UILabel!
    var index = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        nameLabel.text = contactList.contacts[index].Name
        numberLabel.text = contactList.contacts[index].Number
        detailName.text = contactList.contacts[index].Name
        detailNumber.text = contactList.contacts[index].Number
        detailEmail.text = contactList.contacts[index].Email
        detailDOB.text = contactList.contacts[index].DOB
        
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
