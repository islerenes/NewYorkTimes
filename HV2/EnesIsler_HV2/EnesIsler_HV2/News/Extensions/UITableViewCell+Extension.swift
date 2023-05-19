//
//  UITableViewCell+Extension.swift
//  EnesIsler_HV2
//
//  Created by Enes İşler on 16.05.2023.
//

import Foundation
import UIKit

extension UITableViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
