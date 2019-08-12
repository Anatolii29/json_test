//
//  RealmCell.swift
//  json_test
//
//  Created by Anatolii on 7/15/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import Foundation
import UIKit

class RealmCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func update(model: RealmModel?) {
        titleLabel.text = model?.name
        contentLabel.text = model?.title
    }
}
