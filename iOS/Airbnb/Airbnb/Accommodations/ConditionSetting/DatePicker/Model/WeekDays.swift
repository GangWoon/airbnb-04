//
//  WeekDays.swift
//  Airbnb
//
//  Created by Cloud on 2020/05/29.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

enum WeekDays: Int, CustomStringConvertible, CaseIterable {
    
    case Sun = 1, Mon, Tue, Wed, Thu, Fri, Sat

    var description: String {
        switch self {
        case .Sun:
            return "Sun"
        case .Mon:
            return "Mon"
        case .Tue:
            return "Tue"
        case .Wed:
            return "Wed"
        case .Thu:
            return "Thu"
        case .Fri:
            return "Fri"
        case .Sat:
            return "Sat"
        }
    }
    
    func color() -> UIColor {
        switch self {
        case .Sun:
            return .systemRed
        case .Sat:
            return .systemBlue
        default:
            return .systemGray
        }
    }
}
