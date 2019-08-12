//
//  WebViewController.swift
//  json_test
//
//  Created by Anatolii on 7/15/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit
import Foundation
import WebKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    var currentURL: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        loadWebSite()
    }
    
    func loadWebSite() {
        guard let urlString = currentURL else {
            return
        }
        guard let url = URL(string: urlString) else {
            return
        }
        webView.load(URLRequest(url: url))
    }
    
    func update(url: String?) {
        currentURL = url
    }
}
