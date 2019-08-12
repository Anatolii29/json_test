//
//  ViewController.swift
//  json_test
//
//  Created by Anatolii on 7/8/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let ref = Database.database().reference(withPath: "list")
        ref.observe(.value) { (snapshot) in
            if let value = snapshot.value as? [String: Any] {
                debugPrint("-------------")
                debugPrint(value)
                debugPrint("-------------")
            }
        }
        
    }
    
}

