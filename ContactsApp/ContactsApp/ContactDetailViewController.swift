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
    
    @IBOutlet weak var detailEmail: UITextField!
    @IBOutlet weak var detailNumber: UITextField!
    @IBOutlet weak var detailName: UITextField!
    @IBOutlet weak var detailDOB: UITextField!
    
    
    
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
        
        // Replace with your base color
        let baseColor = UIColor.systemGray4
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
    @IBAction func deleteContactButton(_ sender: UIButton) {
        contactList.contacts.remove(at: index)
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
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


