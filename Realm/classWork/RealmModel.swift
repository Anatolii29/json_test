//
//  RealmModel.swift
//  json_test
//
//  Created by Anatolii on 7/15/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit
import RealmSwift

class RealmModel: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var title: String = ""
}
