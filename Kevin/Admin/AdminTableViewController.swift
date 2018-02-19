//
//  AdminTableViewController.swift
//  Kevin
//
//  Created by Tang Tantivirun on 2/4/18.
//  Copyright © 2018 Tantivirun. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase

class AdminTableViewController: UIViewController {
   
    @IBOutlet weak var tableView: UITableView!
    var users = [Member]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadUsers()
    }
    
    func loadUsers(){
        Database.database().reference().child("users").observe(.childAdded) { (snapshot: DataSnapshot) in
            if let dict = snapshot.value as? [String: Any] {
                let nameTextField = dict["name"] as! String
                let emailTextField = dict["email"] as! String
                let user = Member(nameTextField: nameTextField, emailTextField: emailTextField)
                self.users.append(user)
                print(self.users)
                self.tableView.reloadData()
            }
        }
    }
}
extension AdminTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        cell.textLabel?.text = users[indexPath.row].name
        cell.detailTextLabel?.text = users[indexPath.row].email
        return cell
    }
}
