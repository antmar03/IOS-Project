	//
//  EditContactViewController.swift
//  IOS Project
//
//  Created by user237630 on 4/9/23.
//

import UIKit

class EditContactViewController: UIViewController {
    var first_name: String?
    var last_name: String?
    var email: String?
    var address: String?
    var phone: String?
    var notes: String?
    var id: Int?
    
    let db = DBManager()
    
    @IBOutlet weak var notesLabel: UITextField!
    @IBOutlet weak var phoneLabel: UITextField!
    @IBOutlet weak var addressLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var lnameLabel: UITextField!
    @IBOutlet weak var fnameLabel: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardOnTap()
        notesLabel.text = notes
        phoneLabel.text = phone
        addressLabel.text = address
        emailLabel.text = email
        lnameLabel.text = last_name
        fnameLabel.text = first_name
        
    }
    
    @IBAction func OnEditClick(_ sender: UIButton) {
        db.edit(first_name: fnameLabel.text!, last_name: lnameLabel.text!, email: emailLabel.text!, address: addressLabel.text!, phone: phoneLabel.text!, notes: notesLabel.text!, id: id!)
        dismiss(animated: true)
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
