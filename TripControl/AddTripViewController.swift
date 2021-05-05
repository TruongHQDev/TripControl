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
        navigationController?.popViewController(animated: true)
    }
    
}
