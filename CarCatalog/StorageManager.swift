//
//  StorageManager.swift
//  CarCatalog
//
//  Created by 1234 on 16.09.2020.
//  Copyright © 2020 Lisa. All rights reserved.
//

import RealmSwift

let realm = try! Realm()

class StorageManager{
    static func saveObject( _ car: Car) {
        try! realm.write {
            realm.add(car)
        }
    }
    static func deliteObject(_ car: Car){
        try! realm.write {
            realm.delete(car)
        }
    }
    
}
