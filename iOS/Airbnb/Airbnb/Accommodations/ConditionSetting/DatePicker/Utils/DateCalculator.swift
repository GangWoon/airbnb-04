//
//  DateCalculator.swift
//  Airbnb
//
//  Created by TTOzzi on 2020/05/29.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

struct DateCalculator {
    
    // MARK: - Properties
    static private let calendar: Calendar = Calendar.current
    
    // MARK: - Methods
    static func monthLater(value: Int) -> Date? {
        return calendar.date(byAdding: .month, value: value, to: Date())
    }
    
    static func month(from date: Date) -> String? {
        let month = calendar.component(.month, from: date)
        
        return Month(rawValue: month)?.description
    }
    
    static func year(from date: Date) -> String? {
        let year = calendar.component(.year, from: date)
        
        return String(year)
    }
}
