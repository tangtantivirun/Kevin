//
//  Requests.swift
//  Kevin
//
//  Created by Tang Tantivirun on 2/11/18.
//  Copyright © 2018 Tantivirun. All rights reserved.
//

import Foundation
import UIKit

class Requests: NSObject {
    var classes: String?
    var location: String?
    var subject: String?
    
    init(dictionary: [String: Any]) {
        self.classes = dictionary["class"] as? String ?? ""
        self.location = dictionary["location"] as? String ?? ""
        self.subject = dictionary["subject"] as? String ?? ""
    }
}
