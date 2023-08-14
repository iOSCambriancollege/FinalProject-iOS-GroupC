//
//  ContactsTableViewController.swift
//  ContactsApp
//
//  Created by Majid Pawar on 2023-08-03.
//

import UIKit

// importing contacts from JSON
var contactList = ContactsList()
var myIndex = 0
// An Array which only contains Name which i will be using to filter Contact List
var contactName = contactList.contacts.map{$0.Name}
class ContactsTableViewController: UITableViewController,UISearchBarDelegate {
    @IBOutlet weak var contactSearchBar: UISearchBar!
    @IBAction func addContactButton(_ sender: UIBarButtonItem) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        
        //Navigation Title
        navigationItem.title = "Contacts"
        // Navigation Title
        navigationController?.navigationBar.tintColor = .systemRed
        navigationController?.navigationBar.backgroundColor = .white
        
        //To sort the contact list which is displayed on Table View
        contactList.contacts.sort { $0.Name < $1.Name }
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

    //Refresh table Nav button left corner to reload table data
    @IBAction func refreshTable(_ sender: UIBarButtonItem) {
        tableView.reloadData()
    }
    // MARK: - Table view data source

    //Number of sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    //Total rows of contacts array
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contactName.count
    }

    //cell View to display contact name as List
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactListCell", for: indexPath)
        let row = indexPath.row
        cell.textLabel?.text = contactName[row]
//         Configure the cell...

        return cell
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            contactList.contacts.remove(at: indexPath.item)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
            
        }    
    }
    //gives the index of row selected
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var indexList = indexPath.row
            
    }


    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        guard let selectedPath = tableView.indexPathForSelectedRow else { return }
            if let target = segue.destination as? ContactDetailViewController {
                target.index = selectedPath.row
            }
    }
    
    //Search bar filtering through text change and reloading the list view again
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != "" {
            contactName = contactList.contacts.map{$0.Name}.filter({$0.contains(searchText)})
            tableView.reloadData()
        }else{
            contactName = contactList.contacts.map{$0.Name}
            tableView.reloadData()
        }
    }
}
