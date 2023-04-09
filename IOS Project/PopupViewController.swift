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

    @IBOutlet weak var fnameLabel: UILabel!
    @IBOutlet weak var lnameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBOutlet weak var notesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fnameLabel.text = first_name
        lnameLabel.text = last_name
        emailLabel.text = email
        addressLabel.text = address
        phoneLabel.text = phone
        notesLabel.text = notes
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onCloseClick(_ sender: UIButton) {
        view.removeFromSuperview()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "segueShowEdit") {

            let vc = segue.destination as! EditContactViewController
                
            vc.first_name = first_name
            vc.last_name = last_name
            vc.email = email
            vc.address = address
            vc.phone = phone
            vc.notes = notes
            
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
