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
}

