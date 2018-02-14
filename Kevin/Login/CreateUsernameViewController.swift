//
//  CreateUsernameViewController.swift
//  Kevin
//
//  Created by Tang Tantivirun on 2/2/18.
//  Copyright © 2018 Tantivirun. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseDatabase.FIRDataSnapshot

class CreateUsernameViewController: ViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.layer.cornerRadius = 6
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        guard let firUser = Auth.auth().currentUser,
            let username = usernameTextField.text,
           !username.isEmpty else {return}
        
        let userAttrs = ["username": username]
        let ref = Database.database().reference().child("users").child(firUser.uid)
        
        ref.setValue(userAttrs) { (error, ref) in
            if let error = error {
                assertionFailure(error.localizedDescription)
                return
            }
            ref.observeSingleEvent(of: .value, with: { (snapshot) in
                _ = User(snapshot: snapshot)
            })
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
        self.present(vc!, animated: true, completion: nil)
        }
    }
}
