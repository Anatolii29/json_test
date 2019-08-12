//
//  RealmViewController.swift
//  json_test
//
//  Created by Anatolii on 7/15/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit
import RealmSwift

class RealmViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var realmObject: [RealmModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        let xib = UINib(nibName: "RealmCell", bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: "RealmCell")
        
        realmObject = RealmManager.sharedInstance.setData()

        tableView.reloadData()
    }
    
}

extension RealmViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return realmObject.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RealmCell") as! RealmCell
        cell.update(model: realmObject[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
