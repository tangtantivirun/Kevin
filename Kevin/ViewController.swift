//
//  ViewController.swift
//  Kevin
//
//  Created by Tang Tantivirun on 12/4/17.
//  Copyright © 2017 Tantivirun. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewDidAppear(_ animated: Bool) {
        if (Auth.auth().currentUser != nil) {
            self.pressentLoggedInScreen()
        }
    }
    
    @IBAction func createAccountAction(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password, completion: {user, error in
                if let firebaseError = error{
                    print(firebaseError.localizedDescription)
                    return
                }
                 self.pressentLoggedInScreen()
            })
        }
    }
    @IBAction func loginTapped(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text{
            Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                if let firebaseError = error {
                print(firebaseError.localizedDescription)
                return
            }
          self.pressentLoggedInScreen()
        })
        }
    }
    func pressentLoggedInScreen() {
        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let loggedInViewController:LoggedInViewController = storyboard.instantiateViewController(withIdentifier:"LoggedInViewController") as! LoggedInViewController
        self.present(loggedInViewController, animated: true, completion: nil)
    }
}


