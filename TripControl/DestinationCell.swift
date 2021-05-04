//
//  DestinationCell.swift
//  TripControl
//
//  Created by AUTO SERVER on 04/05/2021.
//

import UIKit

class DestinationCell: UITableViewCell {
    @IBOutlet weak var titleDestination: UILabel!
    
    @IBOutlet weak var payedMoney: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
