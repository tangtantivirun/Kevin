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

class AdminTableViewController: UITableViewController {
    @IBOutlet var tableViewUsers: UITableView!
    var ref: DatabaseReference!
    var refHandle: UInt!
    var userList = [UserService]()
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        fetchUsers()
    }
    override func tableView(_ tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
        return userList.count
    }
   func tableView(tableView: UITableView,
                            cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle,
            reuseIdentifier: cellId)
        //Set all cell content
        return cell
    }
    
    func fetchUsers(){
        refHandle = ref.child("Users").observe(.childAdded, with: { (snapshot) in
            if let dictionary = snapshot.value as? [String: AnyObject] {
            
                let user = UserService()
               
                user.setValuesForKeys(dictionary)
                self.userList.append(user)
            }
            self.tableViewUsers.reloadData()
        })
    }
}
