//
//  LoginRealmViewController.swift
//  json_test
//
//  Created by Anatolii on 7/15/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit

class LoginRealmViewController: UIViewController {
    
    @IBOutlet weak var allButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var addStudents: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        allButton.layer.cornerRadius = 10
        clearButton.layer.cornerRadius = 10
        addStudents.layer.cornerRadius = 10
        
    }
    
    @IBAction func allButtonPressed(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "StudentListViewController") as! StudentListViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func clearButtonPressed(_ sender: Any) {
        let alert = UIAlertController(title: "All students will be deleted!", message: " Are you sure?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "yes", style: .default, handler: { action in
            StudentRealmManager.sharedInstance.deleteAll()
        }))
        alert.addAction(UIAlertAction(title: "no", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddStudentViewController") as! AddStudentViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
