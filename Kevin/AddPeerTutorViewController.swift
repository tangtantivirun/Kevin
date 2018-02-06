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
    let firUser = Auth.auth().currentUser
    override func viewDidLoad() {
        super.viewDidLoad()
        refTutors = Database.database().reference().child("PeerTutors").child(firUser!.uid)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func addTutors(){
        let tutor = ["tutorName": nameTextField.text! as String,
                     "tutorSubject": subjectTextField.text! as String
                    ] as [String : Any]
        refTutors.child(firUser!.uid).setValue(tutor)
        labelMessage.text = "Peer Tutor Added"
    }
}
