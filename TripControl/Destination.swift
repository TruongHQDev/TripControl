//
//  Destination.swift
//  TripControl
//
//  Created by AUTO SERVER on 05/05/2021.
//

import Foundation
import RealmSwift

class Destination: Object {
    @objc dynamic var title:        String = ""
    @objc dynamic var date:      String = ""
    @objc dynamic var total:        Double = 0.0
    @objc dynamic var location: String = ""
    var payed = RealmOptional<Double>()
    
    func isExistData() -> Bool {
        return true
    }
    
    convenience init(title: String?, startDate: String?, endDate: String?, total: Double?, payed: Double?) {
        self.init()
        self.title = title ?? ""
        self.date = date ?? ""
        self.location = location ?? ""
        self.total = total ?? 0.0
        self.payed.value = payed ?? 0.0
    }
    
    
    func totalString() -> String? {
        guard let payed = payed.value else { return nil}
        return String(payed)
    }
}
