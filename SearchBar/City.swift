//
//  City.swift
//  search_bar
//
//  Created by Anatolii on 8/5/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit

class City: NSObject {
  
    var name: String = ""
    var photo: String = ""
    var age: Int = 0
    var mer: String = ""
    var population: Double = 0.0
    var square: Double = 0.0
    var museumArray: [Museum] = []
}

class Museum: NSObject {
    var name: String = ""
    var age: Double = 0
    var price: Double = 0
    var museumDescription: String = ""
    var photo: String = ""
}
