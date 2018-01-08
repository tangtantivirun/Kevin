//
//  LoggedInViewController.swift
//  Kevin
//
//  Created by Tang Tantivirun on 1/6/18.
//  Copyright © 2018 Tantivirun. All rights reserved.
//

import Foundation
import FirebaseAuth

class LoggedInViewController: UIViewController {
    @IBAction func logoutTapped(sender: AnyObject) {
        if Auth.auth().currentUser != nil {
            do {
                try Auth.auth().signOut()
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoggedInViewController")
                present(vc, animated: true, completion: nil)
                
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
}

