//
//  RealmManager.swift
//  json_test
//
//  Created by Anatolii on 7/15/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import Foundation
import RealmSwift

class RealmManager {
    
    static let sharedInstance: RealmManager = {
        let instance = RealmManager()
        return instance
    }()
    
    let realm = try! Realm()
    
    func setData() -> [RealmModel] {
        
        deleteAll(array: Array(realm.objects(RealmModel.self)))
        
        let realmObject = RealmModel()
        realmObject.name = "first"
        realmObject.title = "Realm \(realmObject.name)"
        writeObject(realmObject: realmObject)
        
        let realmObject1 = RealmModel()
        realmObject1.name = "second"
        realmObject1.title = "Realm \(realmObject1.name)"
        writeObject(realmObject: realmObject1)
        
        let realmObject2 = RealmModel()
        realmObject2.name = "third"
        realmObject2.title = "Realm \(realmObject2.name)"
        writeObject(realmObject: realmObject2)
        
        let realmObject3 = RealmModel()
        realmObject3.name = "fourth"
        realmObject3.title = "Realm \(realmObject3.name)"
        writeObject(realmObject: realmObject3)
        
        let realmObject4 = RealmModel()
        realmObject4.name = "fifth"
        realmObject4.title = "Realm \(realmObject4.name)"
        writeObject(realmObject: realmObject4)
        
        let arrayRealmObjects = Array(realm.objects(RealmModel.self))
        
        return arrayRealmObjects
    }
    
    func getData() -> [RealmModel] {
        let arrayRealmObjects = Array(realm.objects(RealmModel.self))
        
        return arrayRealmObjects
    }
    
    func writeObject(realmObject: RealmModel) {
        do {
            try realm.write {
                realm.add(realmObject)
            }
        } catch {
            print("Ooops!")
        }
    }
    
    func deleteAll(array: [RealmModel]) {
        if !array.isEmpty {
            try! realm.write {
                realm.delete(array)
            }
        }
    }
}
