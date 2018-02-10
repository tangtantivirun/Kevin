//
//  Time.swift
//  Kevin
//
//  Created by Tang Tantivirun on 2/9/18.
//  Copyright © 2018 Tantivirun. All rights reserved.
//

import Foundation

struct Time {
    var Timestamp: String {
        return "\(NSDate().timeIntervalSince1970 * 1000)"
    }
}
