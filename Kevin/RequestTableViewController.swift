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
        tableView.register(RequestTableViewCell.self, forCellReuseIdentifier: cellId)
        fetchRequest()
    }
    
    func fetchRequest(){
        Database.database().reference().child("request").child((firUser?.uid)!).childByAutoId().observe(.childAdded, with: { (snapshot) in
            if let dictionary = snapshot.value as? [String: AnyObject] {
                let request = Requests(dictionary: dictionary)
                self.requests.append(request)
                
                DispatchQueue.main.async (execute: {
                    self.tableView.reloadData()
                    })
                }
            }, withCancel: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return requests.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        let request = requests[indexPath.row]
        cell.textLabel?.text = request.classes
        cell.detailTextLabel?.text = request.location
        cell.detailTextLabel?.text = request.subject
        
        return cell
    }
}
class RequestTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
