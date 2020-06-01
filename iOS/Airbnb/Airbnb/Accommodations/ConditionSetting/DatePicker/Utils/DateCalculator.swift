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
    
    static func day(of date: Date) -> String {
        let day = calendar.component(.day, from: date)
        
        return String(day)
    }
    
    static func month(from date: Date) -> String? {
        let month = calendar.component(.month, from: date)
        
        return Month(rawValue: month)?.description
    }
    
    static func year(from date: Date) -> String? {
        let year = calendar.component(.year, from: date)
        
        return String(year)
    }
    
    static func firstDay(of month: Date) -> Date? {
        let firstDay = calendar
            .date(from: Calendar.current.dateComponents([.year,.month], from: month))?
            .addingTimeInterval(3600 * 9)
        
        return firstDay
    }
    
    static func weekday(of date: Date) -> Int {
        return calendar.component(.weekday, from: date)
    }
    
    static func end(of month: Date) -> Int {
        guard let monthRange = calendar.range(of: .day, in: .month, for: month) else { return 0 }
        
        return monthRange.count
    }
}
