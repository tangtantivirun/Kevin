//
//  TutorModel.swift
//  Kevin
//
//  Created by Tang Tantivirun on 2/6/18.
//  Copyright © 2018 Tantivirun. All rights reserved.
//

import Foundation

class TutorModel: NSObject {
    var name: String?
    var email: String?
    var subject: String?
    
    init(dictionary: [String: Any]) {
        self.name = dictionary["name"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.subject = dictionary["subject"] as? String ?? ""
    }
}
