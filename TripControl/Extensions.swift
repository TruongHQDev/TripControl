//
//  Extensions.swift
//  TripControl
//
//  Created by AUTO SERVER on 06/05/2021.
//

import Foundation
import UIKit

extension UIViewController {
    func hideKeyBoardWhenTappedAround() {
        let tap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false;
        view.addGestureRecognizer(tap);
    }
    @objc func dismissKeyboard() {
        view.endEditing(true);
    }
}


