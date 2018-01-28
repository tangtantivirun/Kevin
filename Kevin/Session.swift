//
//  Session.swift
//  Kevin
//
//  Created by Tang Tantivirun on 1/27/18.
//  Copyright © 2018 Tantivirun. All rights reserved.
//

import Foundation
import UIKit

struct Session {
        
        //MARK: Properties
        
        var name: String
        var subject: String
        
        //MARK: Initialization
        
        init?(name: String, subject: String) {
            
            // The name must not be empty
            guard !name.isEmpty else {
                return nil
            }
            
            // Initialize stored properties.
            self.name = name
            self.subject = subject
    }
}
