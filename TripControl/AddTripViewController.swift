//
//  AddTripViewController.swift
//  TripControl
//
//  Created by AUTO SERVER on 05/05/2021.
//

import UIKit

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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        
        createTrip()
        
        navigationController?.popViewController(animated: true)
    }
    
    func createTrip() {
        let title = txtTripName.text
        let startDate = pkStartDate.date
//        let trip = Trip(title: <#T##String?#>, startDate: <#T##String?#>, endDate: <#T##String?#>, total: <#T##Double?#>, payed: <#T##Double?#>)
        print("")
    }

    @IBAction func valueChange(_ sender: Any) {
        let dateFormat = DateFormatter()
        dateFormat.dateStyle = DateFormatter.Style.short
        dateFormat.timeStyle = DateFormatter.Style.short
        
        let strDate = dateFormat.string(from: pkStartDate.date)
        print("date: \(strDate)")
        
    }
    
}
