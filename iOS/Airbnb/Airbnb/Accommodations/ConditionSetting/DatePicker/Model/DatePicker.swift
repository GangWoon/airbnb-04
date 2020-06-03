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
    private var firstDayOfMonth: Date {
        guard let month = month,
            let firstDay = calendar.date(from: calendar.dateComponents([.year,.month],
                                                                       from: month)) else { return Date()}
        
        return firstDay
    }
    private var endOfMonth: Int {
        guard let month = month,
            let monthRange = calendar.range(of: .day,
                                            in: .month,
                                            for: month) else { return .zero }
        
        return monthRange.count
    }
    var monthString: String? {
        month?.monthString
    }
    var yearString: String? {
        month?.yearString
    }
    private let calendar: Calendar = .current
    @Published var startDate: Date?
    @Published var endDate: Date?
    private var month: Date?
    
    // MARK: - Methods
    func select(date: Date?) {
        guard let date = date else { return }
        
        guard startDate == nil ||
            endDate == nil else {
                self.startDate = date
                endDate = nil
                
                return
        }
        
        guard let startDate = startDate else {
            self.startDate = date
            self.endDate = nil
            
            return
        }
        
        guard startDate > date else {
            endDate = date
            
            return
        }
        self.startDate = date
        self.endDate = nil
    }
    
    func reset() {
        startDate = nil
        endDate = nil
    }
    
    func isSelectedDate(date: Date) -> Bool {
        return date == startDate || date == endDate
    }
    
    func updateMonth(with index: Int) {
        month = calendar.date(byAdding: .month,
                              value: index,
                              to: Date())
    }
    
    func isPastDay(date: Date) -> Bool {
        return calendar.startOfDay(for: Date()) <= date
    }
    
    func isIncludeInMonth(date: Int) -> Bool {
        return firstDayOfMonth.weekday <= date && date - firstDayOfMonth.weekday < endOfMonth
    }
    
    func convertDate(from index: Int) -> Date {
        let index = index - firstDayOfMonth.weekday
        guard let date = calendar.date(byAdding: .day,
                                       value: index,
                                       to: firstDayOfMonth) else { return Date() }
        
        return date
    }
    
    func isInRange(date: Date) -> Bool {
        guard let startDate = startDate,
            let start = calendar.date(byAdding: .day,
                                      value: 1,
                                      to: startDate),
            let end = endDate else { return false }
        
        return (start..<end).contains(date)
    }
}
