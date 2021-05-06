//
//  TripDetailViewController.swift
//  TripControl
//
//  Created by AUTO SERVER on 04/05/2021.
//

import UIKit

class TripDetailViewController: UIViewController {

    @IBOutlet weak var tableviewDestination: UITableView!
    @IBOutlet weak var vwAddDestination: UIView!
    
    var destinations: [Destination] = []
    var tripID = -1
    override func viewDidLoad() {
        hideKeyBoardWhenTappedAround()
        super.viewDidLoad()
        let nib = UINib(nibName: "DestinationCell", bundle: nil)
        tableviewDestination.register(nib, forCellReuseIdentifier: "DestinationCell")
        tableviewDestination.delegate = self
        tableviewDestination.dataSource = self
        
    }
    
    @IBAction func addDestinationTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DestinationAddedViewController") as! DestinationAddedViewController
        let item = Destination(tripID: tripID, title: nil, date: nil, location: nil, payedPerson: nil, payed: nil)
        vc.update(to: item)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        fetchDestination()
    }
    
    func fetchDestination() {
        destinations.removeAll()
        let realm = RealmService.shared.realm
        
        let realmDes = realm.objects(Destination.self)
        
        for item in realmDes {
            let temp = Destination(tripID: item.tripID, title: item.title, date: item.date, location: item.location, payedPerson: item.payedPerson, payed: item.payed.value)
            temp.tripID = item.tripID
            destinations.append(temp)
        }
        
        DispatchQueue.main.async {
            self.tableviewDestination.reloadData()
        }
    }
}


extension TripDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return destinations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DestinationCell", for: indexPath) as! DestinationCell
        cell.setDestination(item: destinations[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DestinationAddedViewController") as! DestinationAddedViewController
        vc.update(to: destinations[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }
}
