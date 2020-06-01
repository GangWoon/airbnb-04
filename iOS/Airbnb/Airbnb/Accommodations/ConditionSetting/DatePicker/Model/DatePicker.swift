//
//  DatePicker.swift
//  Airbnb
//
//  Created by Cloud on 2020/06/01.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation
import Combine

class DatePicker {
    
    // MARK: - Properties
    static let shared: DatePicker = .init()
    @Published var startDate: Date?
    @Published var endDate: Date?
    
    
    // MARK: - Lifecycle
    private init() { }
    
    // MARK: - Methods
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

