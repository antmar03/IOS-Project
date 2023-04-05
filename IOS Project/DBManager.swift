//
//  DBManager.swift
//  Assignment 4 - SQLite
//
//  Created by user237630 on 4/3/23.
//

import Foundation
import SQLite3

class DBManager {
    
    init() {
        db = openDatabase()
        createTable()
    }
    
    
    let dbPath: String = "myDb.sqlite"
    var db:OpaquePointer?
    
    func openDatabase() -> OpaquePointer? {
        let filePath = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent(dbPath)
        var db: OpaquePointer? = nil
        if sqlite3_open(filePath.path, &db) != SQLITE_OK
        {
            debugPrint("can't open database")
            return nil
        }
        else
        {
            print("Successfully created connection to database at \(dbPath)")
            return db
        }
    }
    
    func createTable() {
        let createTableString = "CREATE TABLE IF NOT EXISTS contacts(Id INTEGER AUTO_INCREMENT PRIMARY KEY, first_name TEXT, last_name TEXT, email TEXT, address TEXT, phone TEXT);"
        var createTableStatement: OpaquePointer? = nil
        //prepare the database for the statement
        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK
        {
            //if the statement works, all is good else catch error
            if sqlite3_step(createTableStatement) == SQLITE_DONE
            {
                print("table created.")
            } else {
                print("table could not be created.")
            }
        } else {
            print("CREATE TABLE statement could not be prepared.")
        }
        sqlite3_finalize(createTableStatement)
    }
    
    func insert(first_name:String, last_name:String, email:String, address:String, phone:String)
        {
            //let data = read()

            let insertStatementString = "INSERT INTO contacts (first_name, last_name, email, address, phone) VALUES (?, ?, ?, ?, ?);"
            var insertStatement: OpaquePointer? = nil
            if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
                //bind the values to the parameters
                sqlite3_bind_text(insertStatement, 1, (first_name as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 2, (last_name as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 3, (email as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 4, (address as NSString).utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 5, (phone as NSString).utf8String, -1, nil)               //run query
                if sqlite3_step(insertStatement) == SQLITE_DONE {
                    print("Successfully inserted row.")
                } else {
                    print("Could not insert row.")
                }
            } else {
                print("INSERT statement could not be prepared.")
            }
            sqlite3_finalize(insertStatement)
        }
    
    
    
    func read() -> [Contact] {
           let queryStatementString = "SELECT * FROM contacts;"
           var queryStatement: OpaquePointer? = nil
           var dataset : [Contact] = []
           if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
               //loop through each result (similar to mysql)
               while sqlite3_step(queryStatement) == SQLITE_ROW {
                   //variables from db
                   let id = sqlite3_column_int(queryStatement, 0)
                   let first_name = String(describing: String(cString: sqlite3_column_text(queryStatement, 1)))
                   let last_name = String(describing: String(cString: sqlite3_column_text(queryStatement, 2)))
                   let email = String(describing: String(cString: sqlite3_column_text(queryStatement, 3)))
                   let address = String(describing: String(cString: sqlite3_column_text(queryStatement, 4)))
                   let phone = String(describing: String(cString: sqlite3_column_text(queryStatement, 5)))
                   
                   
                   dataset.append(Contact(id: Int(id), first_name: first_name, last_name: last_name, email: email, address: address, phone: phone))
               }
           } else {
               print("SELECT statement could not be prepared")
           }
           sqlite3_finalize(queryStatement)
           return dataset
    }
}
