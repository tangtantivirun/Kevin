//
//  AdminViewController.swift
//  Kevin
//
//  Created by Tang Tantivirun on 2/5/18.
//  Copyright © 2018 Tantivirun. All rights reserved.
//

import Foundation
import UIKit

class AdminViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "< Back", style: .plain, target: self, action: #selector(backAction))
    }
    @objc func backAction(){
        //print("Back Button Clicked")
        dismiss(animated: true, completion: nil)
    }
}
