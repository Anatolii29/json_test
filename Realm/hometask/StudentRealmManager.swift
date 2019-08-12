//
//  RealmManager.swift
//  json_test
//
//  Created by Anatolii on 7/15/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import Foundation
import RealmSwift

class StudentRealmManager {
    
    static let sharedInstance: StudentRealmManager = {
        let instance = StudentRealmManager()
        return instance
    }()
    
    let realm = try! Realm()
    
    func getData() -> [StudentRealm] {        
        let arrayRealmObjects = Array(realm.objects(StudentRealm.self))
        return arrayRealmObjects
    }
    
    func writeObject(realmObject: StudentRealm) {
        do {
            try realm.write {
                realm.add(realmObject)
            }
        } catch {
            print("Ooops!")
        }
    }
    
    func deleteAll() {
        let array = Array(realm.objects(StudentRealm.self))
        if !array.isEmpty {
            try! realm.write {
                realm.delete(array)
            }
        }
    }
}
