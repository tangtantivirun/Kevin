//
//  GetRequest.swift
//  Kevin
//
//  Created by Tang Tantivirun on 2/19/18.
//  Copyright © 2018 Tantivirun. All rights reserved.
//

import Foundation

class GetRequest {
    var classes: String
    var location: String
    var subject: String
    var requestedBy: String
    
    init(classesText: String, locationText: String, subjectText: String, requestedByText: String) {
        classes = classesText
        location = locationText
        subject = subjectText
        requestedBy = requestedByText
    }
}
