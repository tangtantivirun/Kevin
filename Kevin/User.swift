//
//  User.swift
//  Kevin
//
//  Created by Tang Tantivirun on 1/28/18.
//  Copyright © 2018 Tantivirun. All rights reserved.
//

import Foundation
import FirebaseAuth

struct User {
    let uid: String
    let email: String
    
    init(authData: User) {
        uid = authData.uid
        email = authData.email
    }
    
    init(uid: String, email: String) {
        self.uid = uid
        self.email = email
    }
}
