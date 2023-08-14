//
//  addContactViewController.swift
//  ContactsApp
//
//  Created by Majid Pawar on 2023-08-04.
//

import UIKit

class AddContactViewController: UIViewController {
    
    // Outlets for UI elements
    @IBOutlet weak var errorNumber: UILabel!
    @IBOutlet weak var errorName: UILabel!
    
    // Variables to store contact details
    var addName: String = ""
    var addNumber: String = ""
    var addEmail: String = ""
    var addDOB: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
                    UIGraphicsBeginImageContext(layer.frame.size)
                    defer { UIGraphicsEndImageContext() }
                    
                    guard let context = UIGraphicsGetCurrentContext() else { return nil }
                    layer.render(in: context)
                    
                    if let image = UIGraphicsGetImageFromCurrentImageContext() {
                        return UIColor(patternImage: image)
                    }
                    return nil
                }
    
    // Action for the name field
    @IBAction func nameField(_ sender: UITextField) {
        // Validate and set the name
        if(sender.text == ""){
            errorName.text = "Name cannot be empty! Please input a Name."
        }
        else{
            addName = sender.text!
        }
    }
    
    // Action for the number field
    @IBAction func numberField(_ sender: UITextField) {
        // Validate and set the Number
        if(sender.text == ""){
            errorNumber.text = "Number cannot be empty! Please input a Number."
        }
        else{
            addNumber = sender.text!
        }
    }
    
    // Action for the email field
    @IBAction func emailFIeld(_ sender: UITextField) {
        addEmail = sender.text!
    }
    
    // Action for the DOB field
    @IBAction func DOBField(_ sender: UITextField) {
        addDOB = sender.text!
    }
    
    // Action for the save field
    @IBAction func saveButton(_ sender: Any) {
        if(addName == ""){
            errorName.text = "Name cannot be empty! Please input a Name."
        }
        else if (addNumber == ""){
            errorNumber.text = "Number cannot be empty! Please input a Number."
        }
        else{
            contactList.addContact(Name: addName, Number: addNumber, Email: addEmail, DOB: addDOB)
        }
    }
}
