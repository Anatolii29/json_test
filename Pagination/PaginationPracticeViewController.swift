//
//  PaginationPracticeViewController.swift
//  json_test
//
//  Created by Anatolii on 7/22/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit

class PaginationPracticeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var urlPaginationNewsString = "https://newsapi.org/v2/everything"
    var newsList: [News] = []
    var searchModel = SearchModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        let xib = UINib(nibName: "PaginationPracticeCell", bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: "PaginationPracticeCell")
        performURLReq()
    }
    
    func reload() {
        DispatchQueue.main.async{
            self.tableView.reloadData()
        }
    }
    
    func performURLReq() {
        
        let searchModel = SearchModel()
        
        if let url = URL(string: urlPaginationNewsString + "?q=\(searchModel.searchKey)&apiKey=\(searchModel.apiKey)&from=\(searchModel.returnDateString(date: searchModel.dataFrom))&to=\(searchModel.returnDateString(date: searchModel.dataTo))&pageSize=\(searchModel.pageSize)&page=\(searchModel.pageNumber)") {
            
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
                guard let data = data else {
                    return
                }
                
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        
                        if !json.isEmpty {
                            //////////////////
                            if let main = json["articles"] as? [[String: Any]] {
                                for element in main {
                                    var news = News()
                                    if let name = element["title"] as? String {
                                        news.name = name
                                    }
                                    if let description = element["description"] as? String {
                                        news.newsDescription = description
                                    }
                                    //                                    if let url = element["url"] as? String {
                                    //                                        news.url = url
                                    //                                    }
                                    //                                    if let category = element["category"] as? String {
                                    //                                        news.category = category
                                    //                                    }
                                    self.newsList.append(news)
                                }
                                
                            }
                            /////////////////
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

extension PaginationPracticeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PaginationPracticeCell") as! PaginationPracticeCell
        cell.update(news: newsList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row + 1 == newsList.count {
            performURLReq()
        }
    }
    
}
