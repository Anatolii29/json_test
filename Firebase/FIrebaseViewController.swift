//
//  FIrebaseViewController.swift
//  json_test
//
//  Created by Anatolii on 7/20/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit

class FIrebaseViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        tableView.delegate = self
        tableView.dataSource = self
        let xib = UINib(nibName: "FirebaseTableViewCell", bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: "FirebaseTableViewCell")
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "FirebaseAddStudentViewController") as! FirebaseAddStudentViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func removeButoonPressed(_ sender: Any) {
    }
    
}

extension FIrebaseViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FirebaseTableViewCell") as! FirebaseTableViewCell
//        cell.update(student: studentArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
