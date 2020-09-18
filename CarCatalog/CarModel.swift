//
//  CarModel.swift
//  CarCatalog
//
//  Created by 1234 on 16.09.2020.
//  Copyright © 2020 Lisa. All rights reserved.
//

import RealmSwift

class Car: Object {
    @objc dynamic var vendor = ""
    @objc dynamic var model = ""
    @objc dynamic var type = ""
    @objc dynamic var year = 0

    func saveCars(){

        let newCar = Car()
        let newCar2 = Car()
        let newCar3 = Car()
        
        newCar.vendor = "Audi"
        newCar.model = "A4"
        newCar.type = "Universal"
        newCar.year = 2015
      
        newCar2.vendor = "Peugeot"
        newCar2.model = "508"
        newCar2.type = "Hatchback"
        newCar2.year = 2018
        
        newCar3.vendor = "Toyota"
        newCar3.model = "Camry"
        newCar3.type = "Sedan"
        newCar3.year = 2006
        
        

        StorageManager.saveObject(newCar)
        StorageManager.saveObject(newCar2)
        StorageManager.saveObject(newCar3)
       }
}
