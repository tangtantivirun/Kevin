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
            let classes = classTextField.text,
            let location = locationTextField.text

     else {
    let error = ""
    //Tells the user that there is an error and then gets firebase to tell them the error
        let alertController = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
    
    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
    alertController.addAction(defaultAction)
    
    self.present(alertController, animated: true, completion: nil)
        return
        }
            let request = ["subject": subject, "classes": classes, "location": location]
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
