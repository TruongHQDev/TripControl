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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
