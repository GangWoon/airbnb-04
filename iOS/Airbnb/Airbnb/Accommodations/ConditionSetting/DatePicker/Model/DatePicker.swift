//
//  DatePicker.swift
//  Airbnb
//
//  Created by Cloud on 2020/06/01.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

class DatePicker {
    
    static let shared: DatePicker = .init()
    var startDate: Date?
    var endDate: Date?
    
    
    private init() { }
    
    func update(date: Date?, completion: @escaping () -> ()) {
        if startDate != nil, endDate != nil {
            startDate = date
            endDate = nil
            completion()
            return
        }
        
        if startDate == nil {
            startDate = date
            completion()
            return
        }
        
        if startDate! > date! {
            startDate = date
        } else {
            endDate = date
        }
        completion()
    }
}

