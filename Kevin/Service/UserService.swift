//
//  UserService.swift
//  Kevin
//
//  Created by Tang Tantivirun on 2/4/18.
//  Copyright © 2018 Tantivirun. All rights reserved.
//

import UIKit

class UserService: NSObject {
    var name: String?
    var email: String?
    init(dictionary: [String: Any]) {
        self.name = dictionary["name"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
    }
}

