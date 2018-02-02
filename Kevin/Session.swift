//
//  Session.swift
//  Kevin
//
//  Created by Tang Tantivirun on 1/27/18.
//  Copyright © 2018 Tantivirun. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase


struct Session {
        
        //MARK: Properties
    let key: String
    let name: String
    let addedByUser: String
    let ref: DatabaseReference?
    var completed: Bool
        
        //MARK: Initialization
        
    init(name: String, addedByUser: String, completed: Bool, key: String = "") {
            // Initialize stored properties.
            self.key = key
            self.name = name
            self.addedByUser = addedByUser
            self.completed = completed
            self.ref = nil
    }
    
    init(snapshot: DataSnapshot) {
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        name = snapshotValue["name"] as! String
        addedByUser = snapshotValue["addedByUser"] as! String
        completed = snapshotValue["completed"] as! Bool
        ref = snapshot.ref
    }
    func toAnyObject() -> Any {
        return [
            "name": name,
            "addedByUser": addedByUser,
            "completed": completed
        ]
    }
}
