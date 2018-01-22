//
//  HomeVC.swift
//  Kevin
//
//  Created by Tang Tantivirun on 1/7/18.
//  Copyright © 2018 Tantivirun. All rights reserved.
//

import Foundation
import FirebaseAuth

class HomeVC: UIViewController {
    @IBOutlet weak var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let currentUserEmail = Auth.auth().currentUser?.email
        
        emailLabel.text = currentUserEmail
        
    }
}
