//
//  StudentRealm.swift
//  json_test
//
//  Created by Anatolii on 7/17/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit
import RealmSwift

class StudentRealm: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var surname: String = ""
    @objc dynamic var age: Int = 0
    @objc dynamic var city: String = ""
    @objc dynamic var sex: String = ""
}
