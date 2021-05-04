//
//  TripDetailViewController.swift
//  TripControl
//
//  Created by AUTO SERVER on 04/05/2021.
//

import UIKit

class TripDetailViewController: UIViewController {

    @IBOutlet weak var tableviewDestination: UITableView!
    
    var destinations: [String] = ["a", "b"]
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "DestinationCell", bundle: nil)
        tableviewDestination.register(nib, forCellReuseIdentifier: "DestinationCell")
        tableviewDestination.delegate = self
        tableviewDestination.dataSource = self
        
    }
    
}


extension TripDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return destinations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DestinationCell", for: indexPath) as! DestinationCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
