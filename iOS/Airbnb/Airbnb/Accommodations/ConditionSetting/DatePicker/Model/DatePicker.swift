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
    private var startCell: CalendarCell?
    private var endCell: CalendarCell?
    
    
    private init() { }
    
    func update(date: CalendarCell?) {
        if startCell != nil, endCell != nil {
            startCell?.toggle(state: false)
            endCell?.toggle(state: false)
            startCell = date
            endCell = nil
            return
        }
        
        if startCell == nil {
            startCell = date
            return
        }
        
        if (startCell?.date)! > date!.date! {
            startCell?.toggle(state: false)
            startCell = date
        } else {
            endCell = date
        }
    }
}

