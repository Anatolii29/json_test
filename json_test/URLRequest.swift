//
//  URLRequest.swift
//  json_test
//
//  Created by Anatolii on 7/10/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit

class URLRequestManager: NSObject {
    
    var host = ""
    var api = ""
    var endpoint = ""
    
    init(host: String, api: String, endpoint: String) {
        self.host = host
        self.api = api
        self.endpoint = endpoint
    }
//    completion: @escaping Data
    func performURLRequest(news: News) {
        
//        let urlStr = urlString + (country?.capital?.lowercased() ?? "")
//        if let url = URL(string: urlStr) {
//            var request = URLRequest(url: url)
//            request.httpMethod = "GET"
//            request.allHTTPHeaderFields = ["X-RapidAPI-Host": "restcountries-v1.p.rapidapi.com", "X-RapidAPI-Key":"173d6310f6mshcc3ae5e1335e282p1cdf48jsn752a2749af15"]
//
//            let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
//                guard let data = data else {
//                    return
//                }
//
//                do {
//                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
//
//
//
//                    }
//
//                }
//                catch let error as NSError {
//                    print("Failed to load: \(error.localizedDescription)")
//                }
//            }
//
//            task.resume()
//        }
    }

}
