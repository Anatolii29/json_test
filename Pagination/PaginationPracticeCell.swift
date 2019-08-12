//
//  PaginationPracticeCell.swift
//  json_test
//
//  Created by Anatolii on 7/22/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import Foundation
import UIKit

class PaginationPracticeCell: UITableViewCell {
    
    @IBOutlet weak var titleLAbel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func update(news: News?) {
        titleLAbel.text = news?.newTitle ?? ""
        descriptionLabel.text = news?.newsDescription ?? ""
    }
    
}
