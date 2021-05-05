//
//  MainTripCell.swift
//  TripControl
//
//  Created by AUTO SERVER on 04/05/2021.
//

import UIKit

class MainTripCell: UITableViewCell {
    @IBOutlet weak var titleTrip: UILabel!
    @IBOutlet weak var timeTrip: UILabel!
    @IBOutlet weak var payedTrip: UILabel!
    
    var idTrip: Int = -1
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setTrip(trip: Trip) {
        titleTrip.text =  trip.title
        timeTrip.text = "Time: \(trip.startDate) - \(trip.endDate)"
        payedTrip.text = "\(trip.payed)"
    }
    
}
