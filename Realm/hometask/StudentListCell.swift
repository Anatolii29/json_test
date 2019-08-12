//
//  StudentListCell.swift
//  json_test
//
//  Created by Anatolii on 7/17/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import Foundation
import UIKit

class StudentListCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var sexLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var lineView: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func update(student: StudentRealm?) {
        nameLabel.text = student?.name
        surnameLabel.text = student?.surname
        sexLabel.text = student?.sex
        ageLabel.text = String(student?.age ?? 0)
        cityLabel.text = student?.city
    }
}
