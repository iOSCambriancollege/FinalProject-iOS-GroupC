//
//  ContactDetailViewController.swift
//  ContactsApp
//
//  Created by Majid Pawar on 2023-08-04.
//

import UIKit
import MessageUI


class ContactDetailViewController: UIViewController {
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var detailEmail: UITextField!
    @IBOutlet weak var detailNumber: UITextField!
    @IBOutlet weak var detailName: UITextField!
    @IBOutlet weak var detailDOB: UITextField!
    
    @IBOutlet weak var backButton: UINavigationItem!
    
    // Edit button action
    @IBAction func EditButton(_ sender: UIButton) {
        // Check the button title to determine the action
        if(sender.titleLabel?.text == "Edit"){
            // Enable editing mode
            sender.setTitle("Save", for: UIControl.State.normal)
            // Enable editing for text fields and change their background color
            detailName.isEnabled = true
            detailNumber.isEnabled = true
            detailEmail.isEnabled = true
            detailDOB.isEnabled = true
            detailName.backgroundColor = .systemYellow
            detailNumber.backgroundColor = .systemYellow
            detailEmail.backgroundColor = .systemYellow
            detailDOB.backgroundColor = .systemYellow
        }
        else if (sender.titleLabel?.text == "Save"){
            // Handle Save action
            if(detailName.text == ""){
                detailName.placeholder = "Please Enter Name"
                errorLabel.text = "Name cannot be null"
            }else{
                sender.setTitle("Edit", for: UIControl.State.normal)
                
                let name = detailName.text
                let num = detailNumber.text
                let mail = detailEmail.text
                let dob = detailDOB.text
                
                if(num == "" || mail == "" || dob == "" ){
                    detailNumber.placeholder = "Please input Number"
                    detailEmail.placeholder = "Please input Email"
                    detailDOB.placeholder = "Please input DOB"
                }
                if (name != ""){
                    contactList.contacts.remove(at: index)
                    contactList.addContact(Name: name!, Number: num!, Email: mail!, DOB: dob!)
                    detailName.backgroundColor = .systemGray4
                    detailNumber.backgroundColor = .systemGray4
                    detailEmail.backgroundColor = .systemGray4
                    detailDOB.backgroundColor = .systemGray4
                    detailName.isEnabled = false
                    detailNumber.isEnabled = false
                    detailEmail.isEnabled = false
                    detailDOB.isEnabled = false
                }
                else{
                    detailName.addTarget(self, action: #selector(checkAndDisplayError(detailName:)), for: UIControl.Event.editingDidEnd)
                }
            }
            
        }
        
    }
    // Function to validate and display error when name is empty
    @objc func checkAndDisplayError(detailName: UITextField){
        
        // Check if the name field is empty
        // Display error and handle UI changes
        if(detailName.text?.count == 0){
            errorLabel.text = "Name cannot be null"
            detailName.text = contactList.contacts[index].Name
            detailName.backgroundColor = .systemGray4
            detailNumber.backgroundColor = .systemGray4
            detailEmail.backgroundColor = .systemGray4
            detailDOB.backgroundColor = .systemGray4
            detailName.isEnabled = false
            detailNumber.isEnabled = false
            detailEmail.isEnabled = false
            detailDOB.isEnabled = false
        }
        else{
            errorLabel.text = ""
        }
    }
    // Index of the selected contact
    var index = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        // Populate UI elements with contact detail
        // Disable text fields for viewing
        // Set background gradient color
        
        nameLabel.text = contactList.contacts[index].Name
        numberLabel.text = contactList.contacts[index].Number
        detailName.text = contactList.contacts[index].Name
        detailNumber.text = contactList.contacts[index].Number
        detailEmail.text = contactList.contacts[index].Email
        detailDOB.text = contactList.contacts[index].DOB
        
        detailName.isEnabled = false
        detailNumber.isEnabled = false
        detailEmail.isEnabled = false
        detailDOB.isEnabled = false


        
        // Replace with your base color
        let baseColor = UIColor.white
        // Create the gradient layer green
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [baseColor.cgColor, UIColor.white.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        if let gradientColor = layerToUIColor(layer: gradientLayer) {
            // Use the gradientColor as needed
            view.backgroundColor = gradientColor
            viewDidAppear(true)
        }
        
        
    }
    // Function to convert layer to UIColor
    func layerToUIColor(layer: CALayer) -> UIColor? {
        // Convert layer to UIColor
        UIGraphicsBeginImageContext(layer.frame.size)
        defer { UIGraphicsEndImageContext() }
        
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        layer.render(in: context)
        
        if let image = UIGraphicsGetImageFromCurrentImageContext() {
            return UIColor(patternImage: image)
        }
        return nil
    }
    
    //Function Email Button
    //This function has been tested on a physical iPhone device and it works completely
    @IBAction func mailButton(_ sender: Any) {
        guard let email = URL(string: "mailto:" + (contactList.contacts[index].Email)) else { return }
        if UIApplication.shared.canOpenURL(email){
            UIApplication.shared.open(email, options: [:],completionHandler: nil)
        } else {
            print("Cannot open email!")
        }
    }
    
    
    
    //Function Call Button
    //This function has been tested on a physical iPhone device and it works completely
    @IBAction func callButtonClicked(_ sender: Any) {
        guard let number = URL(string: "tel://" + (contactList.contacts[index].Number)) else { return }
        if UIApplication.shared.canOpenURL(number) {
            UIApplication.shared.open(number, options: [:], completionHandler: nil)
        } else {
            print("Cannot open phone call!")
        }
    }
    
    //Function Message Button
    //This function has been tested on a physical iPhone device and it works completely
    @IBAction func messageButtonClicked(_ sender: Any) {
        guard let number = URL(string: "sms:" + (contactList.contacts[index].Number)) else { return }
        if UIApplication.shared.canOpenURL(number) {
            UIApplication.shared.open(number, options: [:], completionHandler: nil)
        } else {
            print("Cannot open sms!")
        }
    }
    //Delete Button
    @IBAction func deleteContactButton(_ sender: UIButton) {
        contactList.contacts.remove(at: index)
    }
}


