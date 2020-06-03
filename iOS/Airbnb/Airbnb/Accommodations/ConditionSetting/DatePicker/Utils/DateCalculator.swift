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
        return calendar.date(byAdding: .month,
                             value: value, to: Date())
    }
    
    static func day(of date: Date) -> String {
        let day = calendar.component(.day,
                                     from: date)
        
        return String(day)
    }
    
    static func month(from date: Date) -> String? {
        let month = calendar.component(.month,
                                       from: date)
        
        return Month(rawValue: month)?.description
    }
    
    static func year(from date: Date) -> String? {
        let year = calendar.component(.year,
                                      from: date)
        
        return String(year)
    }
    
    static func isPastDay(date: Date) -> Bool {
        return calendar.startOfDay(for: Date()) <= date
    }
    
    static func date(byAdding: Calendar.Component, value: Int, to: Date?) -> Date {
        guard let to = to,
            let date = calendar.date(byAdding: byAdding,
                                     value: value, to: to) else { return Date() }
        
        return date
    }
    
    static func isInclude(date: Int, into month: Date?) -> Bool {
        let firstofMonth = firstDay(of: month)
        let firstWeekDay = weekday(of: firstofMonth)
        let endofMonth = end(of: month)
        return firstWeekDay <= date && date - firstWeekDay < endofMonth
    }
    
    static func convertDate(from index: Int, month: Date?) -> Date {
        let firstofMonth = firstDay(of: month)
        let index = index - weekday(of: firstofMonth)
        return date(byAdding: .day, value: index, to: firstofMonth)
    }
    
    static func nextDay(of date: Date) -> Date {
        guard let date = calendar.date(byAdding: .day,
                                       value: 1,
                                       to: date) else { return Date() }
        
        return date
    }
    
    static func firstDay(of month: Date?) -> Date? {
        guard let month = month else { return nil }
        let firstDay = calendar.date(from: calendar.dateComponents([.year,.month],
                                                                   from: month))
        
        return firstDay
    }
    
    static func weekday(of date: Date?) -> Int {
        guard let date = date else { return .zero }
        return calendar.component(.weekday,
                                  from: date)
    }
    
    static func end(of month: Date?) -> Int {
        guard let month = month,
            let monthRange = calendar.range(of: .day,
                                            in: .month,
                                            for: month) else { return 0 }
        
        return monthRange.count
    }
    
    static func formattingDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM월 dd일"
        
        return formatter.string(from: date)
    }
}
