//
//  newsTableViewCell.swift
//  json_test
//
//  Created by Anatolii on 7/10/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit

protocol newsTableViewCellDelegate {
    func showWebSite(url: String?)
}

class newsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var websiteButton: UIButton!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var delegate: NewsTableViewController?
    var currentNews: News?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func update(news: News?) {
        currentNews = news
        newsTitleLabel.text = news?.name ?? ""
        categoryLabel.text = news?.category ?? ""
        descriptionLabel.text = news?.newsDescription ?? ""
        websiteButton.setTitle(news?.url ?? "", for: .normal)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    @IBAction func websiteButtomPressed(_ sender: Any) {
        delegate?.showWebSite(url: currentNews?.url ?? "")
    }
    
    
}
