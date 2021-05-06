//
//  DestinationAddedViewController.swift
//  TripControl
//
//  Created by AUTO SERVER on 05/05/2021.
//

import UIKit

class DestinationAddedViewController: UIViewController {

    @IBOutlet weak var lbDestinationName: UILabel!
    @IBOutlet weak var lbDate: UILabel!
    @IBOutlet weak var lbLocation: UILabel!
    @IBOutlet weak var lbPayed: UILabel!
    @IBOutlet weak var lbPersonPayed: UILabel!
    
    @IBOutlet weak var txtDestinationName: UITextField!
    @IBOutlet weak var txtPayed: UITextField!
    @IBOutlet weak var txtLocation: UITextField!
    
    
    @IBOutlet weak var pkDate: UIDatePicker!
    @IBOutlet weak var pkPersonPayed: UIPickerView!
    
    
    @IBOutlet weak var btnSave: UIButton!
    
    var people: [String] = ["", "1", "2", "3"]
    
    var tripID = -1
    var desName = ""
    var location = ""
    var date = ""
    var payed: Double = 0.0
    var personPayed = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyBoardWhenTappedAround()
        pkPersonPayed.dataSource = self
        pkPersonPayed.delegate = self
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        createDestination()
        
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        txtDestinationName.text = desName
        //date
        txtLocation.text = location
        txtPayed.text = "\(Int(payed))"
        let i = Int(people.firstIndex(of: personPayed) ?? 0)
        pkPersonPayed.selectRow(i, inComponent: 0, animated: false)
    }
    
    func createDestination() {
        desName = txtDestinationName.text ?? ""
        location = txtLocation.text ?? ""
        let temp = txtPayed.text ?? "0"
        payed = Double(temp) ?? 0
        let dateFormat = DateFormatter()
        dateFormat.dateStyle = DateFormatter.Style.short
        dateFormat.timeStyle = DateFormatter.Style.short
        
        date = dateFormat.string(from: pkDate.date)
        personPayed = people[pkPersonPayed.selectedRow(inComponent: 0)]
        
        let des = Destination(tripID: tripID, title: desName, date: date, location: location, payedPerson: personPayed, payed: payed)
        RealmService.shared.create(des)
    }
    
    func update(to destination: Destination) {
        tripID = destination.tripID
        desName = "\(destination.title)"
        //date
        location = "\(destination.location)"
        payed = destination.payed.value ?? 0
        personPayed = destination.payedPerson
    }

}


extension DestinationAddedViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return people.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return people[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        personPayed = people[row]
    }
    
}
