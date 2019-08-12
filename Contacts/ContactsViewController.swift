//
//  ContactsViewController.swift
//  json_test
//
//  Created by Anatolii on 7/11/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit
import Contacts

class ContactsViewController: UIViewController {
    
    @IBOutlet weak var contactsTableView: UITableView!
    
    let contactStore = CNContactStore()
    var contacts: [CNContact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
        let xib = UINib(nibName: "ContactsTableViewCell", bundle: nil)
        contactsTableView.register(xib, forCellReuseIdentifier: "ContactsTableViewCell")
        getContacts()
    }
    
    func getContacts() {
        
        let keys = [ CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey, CNContactMiddleNameKey, CNContactEmailAddressesKey ]
        
        
        let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
        
        do {
            try self.contactStore.enumerateContacts(with: request) {
                (contact, stop) in
                self.contacts.append(contact)
            }
        }
        catch {
            print("unable to fetch contacts")
        }
        
    }
    
}

extension ContactsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = contactsTableView.dequeueReusableCell(withIdentifier: "ContactsTableViewCell") as! ContactsTableViewCell
        cell.update(contact: contacts[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Action required", message: nil, preferredStyle: . actionSheet)
        if contacts[indexPath.row].emailAddresses.isEmpty && contacts[indexPath.row].phoneNumbers.isEmpty {
            alert.message = "This contact has no any information"
        }
        else {
            if !contacts[indexPath.row].emailAddresses.isEmpty {
                alert.addAction(UIAlertAction(title: "Send e-mail", style: .default, handler: nil))
            }
            if !contacts[indexPath.row].phoneNumbers.isEmpty {
                alert.addAction(UIAlertAction(title: "Call", style: .default, handler: nil))
            }
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
}
