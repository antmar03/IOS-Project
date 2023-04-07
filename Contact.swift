//
//  Contact.swift
//  IOS Project
//
//  Created by user237630 on 4/5/23.
//

import Foundation


class Contact {
    var id: Int = 0;
    var first_name: String = "";
    var last_name: String = "";
    
    var email: String = "";
    var address: String = "";
    var phone: String = "";
    var notes: String = "";
    
    init(id:Int, first_name:String, last_name:String, email: String, address: String, phone: String, notes: String) {
        
        self.id = id;
        self.first_name = first_name;
        self.last_name = last_name;
        
        self.email = email;
        self.address = address;
        self.phone = phone;
        self.notes = notes;
    }
    
}
