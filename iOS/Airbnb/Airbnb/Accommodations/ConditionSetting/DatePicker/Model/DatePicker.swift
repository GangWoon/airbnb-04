//
//  DatePicker.swift
//  Airbnb
//
//  Created by Cloud on 2020/06/01.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

class DatePicker {
    
    static let shared: DatePicker = .init()
    private var startDate: Date?
    private var endDate: Date?
    
    private init() { }
    
    func update(date: Date?) {
        if startDate != nil, endDate != nil {
            startDate = date
            endDate = nil
            return
        }
        
        if startDate == nil {
            startDate = date
            return
        }
        
        if startDate! > date! {
            startDate = date
        } else {
            endDate = date
        }
    }
}

