//
//  AddPeerTutorViewController.swift
//  Kevin
//
//  Created by Tang Tantivirun on 2/5/18.
//  Copyright © 2018 Tantivirun. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase

class AddPeerTutorViewController: UIViewController {
    var refTutors: DatabaseReference!

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var subjectTextField: UITextField!
    let subject = ["Math and Science", "Writing"]
    var selectedSubject: String?
   
    @IBOutlet weak var addLabel: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        createSubjectPicker()
        addLabel.layer.cornerRadius = 6
    }
    func createSubjectPicker() {
        let subjectPicker = UIPickerView()
        subjectPicker.delegate = self
        
        subjectTextField.inputView = subjectPicker
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        guard let _ = Auth.auth().currentUser,
            let name = nameTextField.text,
            let email = emailTextField.text,
            let subject = subjectTextField.text

            else {
                let error = ""
                //Tells the user that there is an error and then gets firebase to tell them the error
                let alertController = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                
                self.present(alertController, animated: true, completion: nil)
                return
        }
        let tutor = ["name": name, "email": email, "subject": subject] as [String : Any]
        let ref = Database.database().reference().child("Peer Tutor").childByAutoId()
        
        ref.setValue(tutor) { (error, ref) in
            if let error = error {
                assertionFailure(error.localizedDescription)
                return
            }
            ref.observeSingleEvent(of: .value, with: { (snapshot) in
                _ = User(snapshot: snapshot)
            })
        }
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CurrentTutors")
        self.present(vc!, animated: true, completion: nil)
    }
}
extension AddPeerTutorViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return subject.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return subject[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedSubject = subject[row]
        subjectTextField.text = selectedSubject
    }
    
}
