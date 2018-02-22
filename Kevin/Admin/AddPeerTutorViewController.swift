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
    @IBOutlet weak var subjectTextField: UITextField!
    @IBOutlet weak var labelMessage: UILabel!
    
    @IBOutlet weak var tableViewTutors: UITableView!
    
    var tutorList = [TutorModel]()
    
   

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tutorList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AddPeerTutorTableViewCell
        let tutor: TutorModel
        
        tutor = tutorList[indexPath.row]
        
        cell.nameLabel.text = tutor.name
        cell.subjectLabel.text = tutor.subject
        
        return cell
    }
    
    @IBAction func addPeerTutorTapped(_ sender: Any) {
        addTutors()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        refTutors = Database.database().reference().child("PeerTutors")
        refTutors.observe(DataEventType.value, with: { (snapshot) in
            if snapshot.childrenCount > 0 {
                self.tutorList.removeAll()
                
                for tutor in snapshot.children.allObjects as! [DataSnapshot] {
                    let tutorObject = tutor.value as? [String:AnyObject]
                    let tutorName = tutorObject?["tutorName"]
                    let tutorSubject = tutorObject?["tutorSubject"]
                    
                    let tutor = TutorModel(name: tutorName as! String?, subject: tutorSubject as! String?)
                    
                    self.tutorList.append(tutor)
                }
                self.tableViewTutors.reloadData()
            }
        })
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func addTutors(){
        let key = refTutors.childByAutoId().key
        let tutor = ["tutorName": nameTextField.text! as String,
                     "tutorSubject": subjectTextField.text! as String
                    ] as [String : Any]
        refTutors.child(key).setValue(tutor)
        labelMessage.text = "Peer Tutor Added"
    }
}
