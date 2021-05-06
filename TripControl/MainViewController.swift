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
    
    var trips: [Trip] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyBoardWhenTappedAround()
        let realm = RealmService.shared.realm
        let nib = UINib(nibName: "MainTripCell", bundle: nil)
        tableviewTrips.register(nib, forCellReuseIdentifier: "MainTripCell")
        
        tableviewTrips.delegate = self
        tableviewTrips.dataSource = self
        
        print("URL: \(realm.configuration.fileURL)")
    }
    
    @IBAction func addTripTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AddTripViewController") as! AddTripViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        fetchTrip()
        
    }
    
    func fetchTrip() {
        trips.removeAll()
        let realm = RealmService.shared.realm
        
        let realmTrips = realm.objects(Trip.self)
        
        for item in realmTrips {
            let temp = Trip(title: item.title, startDate: item.startDate, endDate: item.endDate, people: item.people.value, total: item.total, payed: item.payed.value)
            temp.ID = item.ID
            trips.append(temp)
        }
        
        DispatchQueue.main.async {
            self.tableviewTrips.reloadData()
        }
    }
    
    
    

}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trips.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTripCell", for: indexPath) as! MainTripCell
        cell.idTrip = trips[indexPath.row].ID
        cell.setTrip(trip: trips[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TripDetailViewController") as! TripDetailViewController
        vc.trip = trips[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}
