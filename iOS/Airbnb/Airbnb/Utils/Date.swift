//
//  Date.swift
//  Airbnb
//
//  Created by Cloud on 2020/05/29.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

extension Date {
    func monthLater(value: Int) -> Date? {
        return Calendar.current.date(byAdding: .month, value: value, to: self)
    }
}
