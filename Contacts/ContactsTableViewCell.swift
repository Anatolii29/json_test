//
//  ContactsTableViewCell.swift
//  json_test
//
//  Created by Anatolii on 7/11/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit
import Contacts

class ContactsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var middleNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var mainConstrain: NSLayoutConstraint!
    @IBOutlet weak var phoneConstrain: NSLayoutConstraint!
    @IBOutlet weak var emailConstrain: NSLayoutConstraint!
    @IBOutlet weak var emailTitleLabel: UILabel!
    @IBOutlet weak var phoneTitleLabel: UILabel!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var phoneView: UIView!
    @IBOutlet weak var lineLabel: UIView!
    
    var curentContact: CNContact?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func update(contact: CNContact) {
        lineLabel.layer.cornerRadius = 8
        curentContact = contact
        nameLabel.text = contact.givenName
        surnameLabel.text = contact.familyName
        middleNameLabel.text = contact.middleName
        emailLabel.text = contact.emailAddresses.count > 0 ? contact.emailAddresses[0].value as String : ""
        phoneLabel.text = contact.phoneNumbers.count > 0 ? contact.phoneNumbers[0].value.stringValue : ""
        if emailLabel.text == "" {
            emailView.isHidden = true
//            emailConstrain.priority = UILayoutPriority(rawValue: 800)
//            emailTitleLabel.isHidden = true
//            emailLabel.isHidden = true
        }
        else {
            emailConstrain.priority = UILayoutPriority(rawValue: 600)
            emailTitleLabel.isHidden = false
            emailLabel.isHidden = false
        }
        if phoneLabel.text == "" {
            phoneConstrain.priority = UILayoutPriority(rawValue: 800)
            phoneTitleLabel.isHidden = true
            phoneLabel.isHidden = true
            
        }
        else {
            phoneConstrain.priority = UILayoutPriority(rawValue: 600)
            phoneTitleLabel.isHidden = false
            phoneLabel.isHidden = false
        }
    }

}
