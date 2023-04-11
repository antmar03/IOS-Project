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
    
    func isEmailValid(email: String) -> Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailNew = NSPredicate(format: "SELF MATCHES %@", regex)
        if emailNew.evaluate(with: email) {
            //now we check if it exists
            let contacts = db.read()
            //loop through contacts
            for contact in contacts {
                if(contact.email == email) {
                    return false;
                }
            }
            return true;
        }
        return false;
    }
    
    func isPhoneValid(phone: String) -> Bool {
        let regex = #"^\(?\d{3}\)?[ -]?\d{3}[ -]?\d{4}$"#
        let phone = NSPredicate(format: "SELF MATCHES %@", regex)
        return phone.evaluate(with: phone)
    }
    
    @IBAction func onAddContact(_ sender: UIButton) {
        //the escape characters are breaking my regex for the phone and i have no idea why so I can't get phone formatting to work
        if(isEmailValid(email: emailField.text ?? " ")) {
            db.insert(first_name: fNameField.text!, last_name: lNameField.text!, email: emailField.text!, address: addressField.text!, phone: phoneField.text!, notes: notesField.text!)
        }else {
            //display a message letting them know to check their formatting
            let msg = "Check your formatting for your phone and email"
            
            let alert = UIAlertController(title: "Are You Sure?", message: msg, preferredStyle: .alert)
            
            //use handler to run code when yes is completed
            let ok = UIAlertAction(title: "Ok", style: .default)
            
            alert.addAction(ok)
            present(alert, animated: false)
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
