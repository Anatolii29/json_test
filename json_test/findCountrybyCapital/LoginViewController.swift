//
//  LoginViewController.swift
//  json_test
//
//  Created by Anatolii on 7/8/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit

//var urlString = "https://restcountries-v1.p.rapidapi.com/capital/"


class LoginViewController: UIViewController {
    
    @IBOutlet weak var capitalTextField: UITextField!
    
    var country: Country?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        country = Country()
    }
    
    func performURLRequest() {
        let urlStr = urlString + (capitalTextField.text?.lowercased() ?? "")
        let url = URL(string: urlStr)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = ["X-RapidAPI-Host": "restcountries-v1.p.rapidapi.com", "X-RapidAPI-Key":"173d6310f6mshcc3ae5e1335e282p1cdf48jsn752a2749af15"]
        
        let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
            guard let data = data else {
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                    
                    if !json.isEmpty {
                        if let main = json.first as? [String: Any] {
                            if let countryName = main["name"] as? String {
                                self.country?.name = countryName
                            }
                            if let code = main["alpha2Code"] as? String {
                                self.country?.code = code
                            }
                            if let capital = main["capital"] as? String {
                                self.country?.capital = capital
                            }
                            if let population = main["population"] as? Int {
                                self.country?.population = population
                            }
                            if let area = main["area"] as? Int {
                                self.country?.square = area
                            }
                            if let currency = main["currencies"] as? [String] {
                                if !currency.isEmpty {
                                    if let curr = currency.first as? String {
                                        self.country?.currency = curr
                                    }
                                }
                            }
                        }
                    }
                    
                }
                self.gotoNextScreen()
            }
            catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
            }
        }
        
        task.resume()
    }
    
    func gotoNextScreen() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ScrollViewController") as! ScrollViewController
        vc.update(currCountry: country)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func findButtonPressed(_ sender: Any) {
        
        guard !(capitalTextField.text?.isEmpty ?? true) else {
            return
        }
        
        country?.capital = capitalTextField.text ?? ""
//        peformURLRequest()
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "ScrollViewController") as! ScrollViewController
        vc.update(currCountry: country)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
