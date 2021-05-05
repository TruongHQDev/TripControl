//
//  Trip.swift
//  TripControl
//
//  Created by AUTO SERVER on 05/05/2021.
//

import Foundation
import RealmSwift

class Trip: Object {
    @objc dynamic var title:        String = ""
    @objc dynamic var startDate:    String = ""
    @objc dynamic var endDate:      String = ""
    @objc dynamic var total:        Double = 0.0
    var payed = RealmOptional<Double>()
    var people = RealmOptional<Int>()
    
    func isExistData() -> Bool {
        return true
    }
    
    convenience init(title: String?, startDate: String?, endDate: String?, total: Double?, payed: Double?) {
        self.init()
        self.title = title ?? ""
        self.startDate = startDate ?? ""
        self.endDate = endDate ?? ""
        self.total = total ?? 0.0
        self.payed.value = payed ?? 0.0
    }
    
    
    func payedString() -> String? {
        guard let payed = payed.value else { return nil}
        return String(payed)
    }
    
    func peopleString() -> String? {
        guard let people = people.value else { return nil}
        return String(people)
    }
}
