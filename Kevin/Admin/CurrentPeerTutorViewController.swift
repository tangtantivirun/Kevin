//
//  CurrentPeerTutorViewController.swift
//  Kevin
//
//  Created by Tang Tantivirun on 2/22/18.
//  Copyright © 2018 Tantivirun. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseDatabase

class CurrentPeerTutorViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var tutors = [Tutors]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        self.tableView.rowHeight = 80
        loadCurrentTutors()
    }
    
    func loadCurrentTutors() {
        Database.database().reference().child("Peer Tutor").observe(.childAdded) { (snapshot: DataSnapshot) in
            if let dict = snapshot.value as? [String: Any] {
                let nameText = dict["name"] as! String
                let emailText = dict["email"] as! String
                let subjectText = dict["subject"] as! String
                let tutor = Tutors(nameText: nameText , emailText: emailText, subjectText: subjectText)
                self.tutors.append(tutor)
                print(self.tutors)
                self.tableView.reloadData()
            }
        }
    }
}
extension CurrentPeerTutorViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tutors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! CurrentPeerTutorTableViewCell
        cell.nameText?.text = tutors[indexPath.row].name
        cell.emailText?.text = tutors[indexPath.row].email
        cell.subjectText?.text = tutors[indexPath.row].subject
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            tutors.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
}
