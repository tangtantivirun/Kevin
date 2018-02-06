//
//  User.swift
//  Kevin
//
//  Created by Tang Tantivirun on 1/28/18.
//  Copyright © 2018 Tantivirun. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase.FIRDataSnapshot

struct User {
    let uid: String
    let username: String
    
    init(uid: String, username: String) {
        self.uid = uid
        self.username = username
    }
init?(snapshot: DataSnapshot) {
    guard let dict = snapshot.value as? [String: Any],
        let username = dict["username"] as? String
        else { return nil }
    
        self.uid = snapshot.key
        self.username = username
    }
//   userRef.observeSingleEvent(of: .value, with: { (snapshot) in
//    if let user = User(snapshot: snapshot) {
//        print("Welcome back, \(user.username).")
//    } else {
//    print("New user!")
//    }
//    })
}

