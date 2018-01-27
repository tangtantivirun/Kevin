//
//  StudentTableViewCell.swift
//  Kevin
//
//  Created by Tang Tantivirun on 1/27/18.
//  Copyright © 2018 Tantivirun. All rights reserved.
//

import Foundation
import UIKit

class StudentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subjectLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
