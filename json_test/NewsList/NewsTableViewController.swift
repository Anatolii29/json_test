//
//  NewsTableViewController.swift
//  json_test
//
//  Created by Anatolii on 7/10/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit

var urlNewsString = "https://newsapi.org/v2/sources"

class NewsTableViewController: UIViewController {
    
    @IBOutlet weak var newsTableView: UITableView!
    
    var newsList: [News] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsTableView.delegate = self
        newsTableView.dataSource = self
        let xib = UINib(nibName: "newsTableViewCell", bundle: nil)
        newsTableView.register(xib, forCellReuseIdentifier: "newsTableViewCell")
        performURLRequest()
    }
    
    func reload() {
        DispatchQueue.main.async{
            self.newsTableView.reloadData()
        }
    }
    
    func performURLRequest() {
        if let url = URL(string: urlNewsString) {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
                        request.allHTTPHeaderFields = ["X-Api-Key": "d51980b4fc434993b47141d1db23b2a4"]
            
            let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
                guard let data = data else {
                    return
                }
                
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        
                        if !json.isEmpty {
                            if let main = json["sources"] as? [[String: Any]] {
                                for element in main {
                                    var news = News()
                                    if let name = element["name"] as? String {
                                        news.name = name
                                    }
                                    if let description = element["description"] as? String {
                                        news.newsDescription = description
                                    }
                                    if let url = element["url"] as? String {
                                        news.url = url
                                    }
                                    if let category = element["category"] as? String {
                                        news.category = category
                                    }
                                    self.newsList.append(news)
                                }
                                
                            }
                        }
                        self.reload()
                    }
                    
                }
                catch let error as NSError {
                    print("Failed to load: \(error.localizedDescription)")
                }
            }
            
            task.resume()
        }
    }
    
}

extension NewsTableViewController: UITableViewDelegate, UITableViewDataSource, newsTableViewCellDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newsTableView.dequeueReusableCell(withIdentifier: "newsTableViewCell") as! newsTableViewCell
        cell.delegate = self
        cell.update(news: newsList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func showWebSite(url: String?) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
        vc.update(url: url)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
