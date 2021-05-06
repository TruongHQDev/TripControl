//
//  Destination.swift
//  TripControl
//
//  Created by AUTO SERVER on 05/05/2021.
//

import Foundation
import RealmSwift

class Destination: Object {
    @objc dynamic var destinationID: Int = -1
    @objc dynamic var tripID:        Int = -1
    @objc dynamic var title:        String = ""
    @objc dynamic var date:      String = ""
//    @objc dynamic var total:        Double = 0.0
    @objc dynamic var location: String = ""
    @objc dynamic var payedPerson: String = ""
    var payed = RealmOptional<Double>()
    
    func isExistData() -> Bool {
        return true
    }
    
    convenience init(tripID: Int?, title: String?, date: String?, location: String?, payedPerson: String? ,payed: Double?) {
        self.init()
        self.tripID = tripID ?? -1
        self.title = title ?? ""
        self.date = date ?? ""
        self.location = location ?? ""
        self.payedPerson = payedPerson ?? ""
        self.payed.value = payed ?? 0.0
    }
    
    
    func totalString() -> String? {
        guard let payed = payed.value else { return nil}
        return String(payed)
    }
}
