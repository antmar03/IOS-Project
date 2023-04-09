//
//  ContactsViewController.swift
//  IOS Project
//
//  Created by user237630 on 4/4/23.
//

import UIKit

class ContactsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var db = DBManager()
    var contacts = Array<Contact>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contacts = db.read()
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
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


extension ContactsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let popupVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "popupBoard") as! PopupViewController
        let contact = contacts[indexPath.row]
        
        popupVC.first_name = contact.first_name
        popupVC.last_name = contact.last_name
        popupVC.email = contact.email
        popupVC.address = contact.address
        popupVC.phone = contact.phone
        popupVC.notes = contact.notes
        popupVC.id = contact.id
        
        self.addChild(popupVC)
        popupVC.view.frame = self.view.frame
        self.view.addSubview(popupVC.view)
        popupVC.didMove(toParent: self)
        
    }
}

extension ContactsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell") ?? UITableViewCell()
        let currentContact = contacts[indexPath.row];
        let id = currentContact.id;
        let first_name = currentContact.first_name
        let last_name = currentContact.last_name
        let email = currentContact.email
        let address = currentContact.address
        let phone = currentContact.phone
        let notes = currentContact.notes
        
        cell.textLabel?.text = "ID: \(id)\nFirst Name: \(first_name) \nLast Name: \(last_name)\nEmail: \(email) Phone: \(phone)\nAddress: \(address)\nNotes: \(notes)"
        
        cell.textLabel?.numberOfLines = 0
        
        return cell
    }
}

