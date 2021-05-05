//
//  AddTripViewController.swift
//  TripControl
//
//  Created by AUTO SERVER on 05/05/2021.
//

import UIKit
import Realm
import RealmSwift

class AddTripViewController: UIViewController {

    @IBOutlet weak var lbTripName: UILabel!
    @IBOutlet weak var lbStartDate: UILabel!
    @IBOutlet weak var lbEndDate: UILabel!
    @IBOutlet weak var lbPeople: UILabel!
    
    @IBOutlet weak var txtTripName: UITextField!
    @IBOutlet weak var txtPeople: UITextField!
    
    @IBOutlet weak var pkStartDate: UIDatePicker!
    @IBOutlet weak var pkEndDate: UIDatePicker!
    
    @IBOutlet weak var btnSave: UIButton!
    
    var tripName = ""
    var startDate = ""
    var endDate = ""
    var people:Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        
        createTrip()
        
        navigationController?.popViewController(animated: true)
    }
    
    func createTrip() {
        tripName = txtTripName.text ?? ""
        if let p = txtPeople.text as? Int? {
            people = p ?? 1
        } else {
            people = 1
        }
        
        let trip = Trip(title: tripName, startDate: startDate, endDate: endDate, people: people, total: 0, payed: 0)
        let realm = RealmService.shared.realm
        let count = realm.objects(Trip.self).count
        trip.ID = count + 1
        RealmService.shared.create(trip)
    }

    @IBAction func valueChange(_ sender: Any) {
        let dateFormat = DateFormatter()
        dateFormat.dateStyle = DateFormatter.Style.short
        dateFormat.timeStyle = DateFormatter.Style.short
        
        startDate = dateFormat.string(from: pkStartDate.date)
        
    }
    
    @IBAction func endDateChange(_ sender: Any) {
        let dateFormat = DateFormatter()
        dateFormat.dateStyle = DateFormatter.Style.short
        dateFormat.timeStyle = DateFormatter.Style.short
        
        endDate = dateFormat.string(from: pkEndDate.date)
//        print("date: \(strDate)")
    }
}
