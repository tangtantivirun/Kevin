//
//  CurrentRequestViewController.swift
//  Kevin
//
//  Created by Tang Tantivirun on 2/19/18.
//  Copyright © 2018 Tantivirun. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase
import FirebaseAuth

class CurrentRequestViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var requests = [GetRequest]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        self.tableView.rowHeight = 120
        loadCurrentRequests()
    }
    
    func loadCurrentRequests() {
        Database.database().reference().child("request").observe(.childAdded) { (snapshot: DataSnapshot) in
            if let dict = snapshot.value as? [String: Any] {
                let classesText = dict["classes"] as! String
                let locationText = dict["location"] as! String
                let subjectText = dict["subject"] as! String
                let requestedByText = dict["requested by"] as! String
                let request = GetRequest(classesText: classesText , locationText: locationText, subjectText: subjectText, requestedByText: requestedByText)
                self.requests.append(request)
                print(self.requests)
                self.tableView.reloadData()
            }
        }
    }
}
extension CurrentRequestViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return requests.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! CurrentRequestTableViewCell
        cell.subjectLabel?.text = requests[indexPath.row].subject
        cell.classLabel?.text = requests[indexPath.row].classes
        cell.nameLabel?.text = requests[indexPath.row].requestedBy
        cell.locationLabel?.text = requests[indexPath.row].location
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            requests.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
}


