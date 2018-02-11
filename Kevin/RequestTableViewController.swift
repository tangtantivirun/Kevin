//
//  RequestTableViewController.swift
//  Kevin
//
//  Created by Tang Tantivirun on 2/11/18.
//  Copyright © 2018 Tantivirun. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase
import Firebase

class RequestTableViewController: UITableViewController {
    let firUser = Auth.auth().currentUser
    var requests = [Requests]()
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchRequest()
    }
    
    func fetchRequest(){
        Database.database().reference().child("requests").child((firUser?.uid)!).observe(.childAdded, with: { (snapshot) in
            if let dictionary = snapshot.value as? [String: AnyObject] {
                let request = Requests()
                request.setValuesForKeys(dictionary)
                self.requests.append(request)
                
               DispatchQueue.main.async { [unowned self] in
                    self.tableView.reloadData()
                }
    
                print(request.classes!, request.location!, request.subject!)
            }
//            print("Request found")
//            print(snapshot)
        }, withCancel: nil)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return requests.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        let request = requests[indexPath.row]
        cell.textLabel?.text = request.classes
        cell.detailTextLabel?.text = request.location 
        return cell
    }
}
