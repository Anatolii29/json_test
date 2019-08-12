//
//  StudentListViewController.swift
//  json_test
//
//  Created by Anatolii on 7/17/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit

class StudentListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var studentArray: [StudentRealm] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let xib = UINib(nibName: "StudentListCell", bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: "StudentListCell")
        
        studentArray = StudentRealmManager.sharedInstance.getData()
        tableView.reloadData()
    }

}

extension StudentListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentListCell") as! StudentListCell
        cell.update(student: studentArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
