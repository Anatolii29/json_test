//
//  NewsLoginViewController.swift
//  json_test
//
//  Created by Anatolii on 7/10/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit

class NewsLoginViewController: UIViewController {
    
    @IBOutlet weak var findButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        findButton.layer.cornerRadius = 8
    }

    @IBAction func findButtonPressed(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "NewsTableViewController") as! NewsTableViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
