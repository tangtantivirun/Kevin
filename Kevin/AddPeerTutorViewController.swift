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

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var subjectTextField: UITextField!
    @IBOutlet weak var labelMessage: UILabel!
    @IBAction func addPeerTutorTapped(_ sender: Any) {
        addTutors()
    }
    var refTutors: DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()
        refTutors = Database.database().reference().child("PeerTutors")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func addTutors(){
        let key = refTutors.childByAutoId().key
        
        let tutor = ["id": key,
                     "tutorName": nameTextField.text! as String,
                     "tutorSubject": subjectTextField.text! as String
                    ]
        refTutors.child(key).setValue(tutor)
        labelMessage.text = "Peer Tutor Added"
    }
}
