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
    @IBOutlet weak var lbPayed: UILabel!
    @IBOutlet weak var lbPersonPayed: UILabel!
    
    @IBOutlet weak var txtDestinationName: UITextField!
    @IBOutlet weak var txtPayed: UITextField!

    
    @IBOutlet weak var pkDate: UIDatePicker!
    @IBOutlet weak var pkPersonPayed: UIPickerView!
    
    
    @IBOutlet weak var btnSave: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func saveTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    

}
