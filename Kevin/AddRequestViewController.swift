//
//  AddRequestViewController.swift
//  Kevin
//
//  Created by Tang Tantivirun on 2/4/18.
//  Copyright © 2018 Tantivirun. All rights reserved.
//

import Foundation
import Firebase
import UIKit

class AddRequestViewController: UIViewController {
    
    @IBOutlet weak var subjectTextField: UITextField!
    @IBOutlet weak var classTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        guard let firUser = Auth.auth().currentUser,
            let subject = subjectTextField.text,
            !subject.isEmpty else {return}
        
        let request = ["subject": subject]
        let ref = Database.database().reference().child("request").child(firUser.uid)

        ref.setValue(request) { (error, ref) in
            if let error = error {
                assertionFailure(error.localizedDescription)
                return
            }
            ref.observeSingleEvent(of: .value, with: { (snapshot) in
                _ = User(snapshot: snapshot)
            })
        }
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Session")
        self.present(vc!, animated: true, completion: nil)
    }
}
