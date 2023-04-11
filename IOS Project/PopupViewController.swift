//
//  PopupViewController.swift
//  IOS Project
//
//  Created by user237630 on 4/9/23.
//

import UIKit

class PopupViewController: UIViewController {
    var first_name: String?
    var last_name: String?
    var email: String?
    var address: String?
    var phone: String?
    var notes: String?
    var id: Int?

    @IBOutlet weak var fnameLabel: UILabel!
    @IBOutlet weak var lnameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBOutlet weak var notesLabel: UILabel!
    
    @IBOutlet weak var notesField: UITextField!
    let db = DBManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fnameLabel.text = first_name
        lnameLabel.text = last_name
        emailLabel.text = email
        addressLabel.text = address
        phoneLabel.text = phone
        notesField.text = notes
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onCloseClick(_ sender: UIButton) {
        view.removeFromSuperview()
    }
    
    func deleteHandler(aler: UIAlertAction!) {
     
    }
    
    @IBAction func onDeleteClick(_ sender: UIButton) {
	
        let msg = "Are you sure you want to delete this?\nThis cannot be undone!!"
        
        let alert = UIAlertController(title: "Are You Sure?", message: msg, preferredStyle: .alert)
        
        //use handler to run code when yes is completed
        let yes = UIAlertAction(title: "Yes", style: .default,handler: {_ in
            self.db.deleteContact(id: self.id ?? -1)
            print("deleted id \(String(describing: self.id))")
        })
        
        let no = UIAlertAction(title: "No", style: .destructive, handler: {_ in
            print("cancelled")
        })
        
            
        
        
        alert.addAction(yes);
        alert.addAction(no);
        
        present(alert, animated: true)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "segueShowEdit") {

            let vc = segue.destination as! EditContactViewController
            
            //set the values in the segue
            vc.first_name = first_name
            vc.last_name = last_name
            vc.email = email
            vc.address = address
            vc.phone = phone
            vc.notes = notes
            vc.id = id
            
        }
    }
    
    
    @IBAction func onSaveNote(_ sender: UIButton) {
        db.edit(first_name: first_name!, last_name: last_name!, email: email!, address: address!, phone: phone!, notes: notesField.text!, id: id!)
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
