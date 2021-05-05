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
    
    var destinations: [String] = ["a", "b"]
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "DestinationCell", bundle: nil)
        tableviewDestination.register(nib, forCellReuseIdentifier: "DestinationCell")
        tableviewDestination.delegate = self
        tableviewDestination.dataSource = self
        
    }
    
    @IBAction func addDestinationTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DestinationAddedViewController") as! DestinationAddedViewController
        navigationController?.pushViewController(vc, animated: true)
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DestinationAddedViewController") as! DestinationAddedViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}
