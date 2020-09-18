//
//  ViewController.swift
//  CarCatalog
//
//  Created by 1234 on 15.09.2020.
//  Copyright © 2020 Lisa. All rights reserved.
//

import UIKit
import RealmSwift

class MainViewController: UITableViewController{
    var newCar = Car()
    var cars: Results<Car>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cars = realm.objects(Car.self)
       
        if cars.isEmpty {
        newCar.saveCars()
        }
        else {return}
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.isEmpty ? 0 : cars.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CustomTableViewCell
        
        let car = cars[indexPath.row]
        
        cell.ModelLabel.text = car.model
        cell.VendorLabel.text = car.vendor
        cell.YearLabel.text = "\(car.year)"
        cell.TypeLabel.text = car.type
        
        return cell
    }
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue){
        guard let newCarVC = segue.source as? NewCarVC else {return}
        newCarVC.saveCar()
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let car = cars[indexPath.row]
        let deliteAction = UIContextualAction(style: .destructive, title: "Delete") { (_, _, _) in
            StorageManager.deliteObject(car)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        return UISwipeActionsConfiguration(actions: [deliteAction])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail"{
               guard let indexPath = tableView.indexPathForSelectedRow else { return }
               let car = cars[indexPath.row]
               let newCarVC = segue.destination as! NewCarVC
               newCarVC.currentCar = car
           }
       }
}

