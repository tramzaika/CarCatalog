//
//  NewCarVC.swift
//  CarCatalog
//
//  Created by 1234 on 16.09.2020.
//  Copyright © 2020 Lisa. All rights reserved.
//

import UIKit

class NewCarVC: UITableViewController {
    var newCar = Car()
    var currentCar: Car?
    
    
    @IBOutlet var saveButton: UIBarButtonItem!
    @IBOutlet var carVendor: UITextField!
    @IBOutlet var carModel: UITextField!
    @IBOutlet var carType: UITextField!
    @IBOutlet var carYear: UITextField!
    
    
    override func viewDidLoad() {
         super.viewDidLoad()
         
         saveButton.isEnabled = false
         
         carYear.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
         carModel.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
         carVendor.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
         carType.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
         
         setupEditScreen()
         
     }
    @objc private func textFieldChanged() {
    if
            carVendor.text?.isEmpty == false &&
            carType.text?.isEmpty == false &&
            carModel.text?.isEmpty == false &&
            carYear.text?.isEmpty == false
    {
            saveButton.isEnabled = true
    } else{
    saveButton.isEnabled = false
    }
    }
    
    func saveCar(){
    
        newCar.model = carModel.text ?? ""
        newCar.type = carType.text ?? ""
        newCar.year = Int(carYear.text!) ?? 0
        newCar.vendor = carVendor.text ?? ""
        
        if currentCar != nil {
            try! realm.write {
                currentCar?.vendor = newCar.vendor
                currentCar?.model = newCar.model
                currentCar?.type = newCar.type
                currentCar?.year = newCar.year
            }
        } else {
              StorageManager.saveObject(newCar)
        }
      
       
    }
    
    
    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
    private func setupEditScreen() {
           if currentCar != nil {
               
               setupNavigationBar()
               
               carVendor.text = currentCar?.vendor
               carYear.text = "\(currentCar?.year ?? 0)"
               carModel.text = currentCar?.model
               carType.text = currentCar?.type
           }
       }
    
    private func setupNavigationBar(){
           navigationItem.leftBarButtonItem = nil
           title = currentCar?.model
           saveButton.isEnabled = true
       }
       
}
