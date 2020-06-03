//
//  Date.swift
//  Airbnb
//
//  Created by TTOzzi on 2020/06/03.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

extension Date {
    
    var description: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "M월 d일"
        
        return formatter.string(from: self)
    }
    
    var weekday: Int {
        Calendar.current.component(.weekday, from: self)
    }
    
    var weekdayColor: UIColor? {
        WeekDays(rawValue: Calendar.current.component(.weekday, from: self))?.color()
    }
    
    var dayString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        
        return formatter.string(from: self)
    }
    
    var monthString: String? {
        let monthValue = Calendar.current.component(.month,
                                       from: self)
        
        return Month(rawValue: monthValue)?.description
    }
    
    var yearString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY"
        
        return formatter.string(from: self)
    }
}

