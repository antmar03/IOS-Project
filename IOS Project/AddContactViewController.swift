//
//  AddContactViewController.swift
//  IOS Project
//
//  Created by user237630 on 4/4/23.
//

import UIKit

class AddContactViewController: UIViewController {
    var db = DBManager()
    
    //text fields
    @IBOutlet weak var fNameField: UITextField!
    
    @IBOutlet weak var lNameField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var addressField: UITextField!
    
    @IBOutlet weak var phoneField: UITextField!
    
    @IBOutlet weak var notesField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onAddContact(_ sender: UIButton) {
        db.insert(first_name: fNameField.text!, last_name: lNameField.text!, email: emailField.text!, address: addressField.text!, phone: phoneField.text!, notes: notesField.text!)
        
        
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
