//
//  MainViewController.swift
//  TripControl
//
//  Created by AUTO SERVER on 04/05/2021.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var tableviewTrips: UITableView!
    
    @IBOutlet weak var vwAddButton: UIView!
    @IBOutlet weak var btnAddTrip: UIButton!
    
    var trips: [String] = ["1", "2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "MainTripCell", bundle: nil)
        tableviewTrips.register(nib, forCellReuseIdentifier: "MainTripCell")
        
        tableviewTrips.delegate = self
        tableviewTrips.dataSource = self
    }
    
    @IBAction func addTripTapped(_ sender: Any) {
        
    }
    

}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trips.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTripCell", for: indexPath) as! MainTripCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
