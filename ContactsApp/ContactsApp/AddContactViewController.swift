//
//  addContactViewController.swift
//  ContactsApp
//
//  Created by Majid Pawar on 2023-08-04.
//

import UIKit

class AddContactViewController: UIViewController {
    
    @IBOutlet weak var errorNumber: UILabel!
    @IBOutlet weak var errorName: UILabel!
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
    
    @IBAction func nameField(_ sender: UITextField) {
        if(sender.text == ""){
            errorName.text = "Name cannot be empty! Please input a Name."
        }
        else{
            addName = sender.text!
        }
    }
    
    @IBAction func numberField(_ sender: UITextField) {
    
        if(sender.text == ""){
            errorNumber.text = "Number cannot be empty! Please input a Number."
        }
        else{
            addNumber = sender.text!
        }
    }
    
    
    @IBAction func emailFIeld(_ sender: UITextField) {
        addEmail = sender.text!
    }
    
    
    @IBAction func DOBField(_ sender: UITextField) {
        addDOB = sender.text!
    }
    
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
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
