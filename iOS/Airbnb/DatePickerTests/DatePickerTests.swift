//
//  DatePickerTests.swift
//  DatePickerTests
//
//  Created by Cloud on 2020/06/02.
//  Copyright © 2020 Cloud. All rights reserved.
//

import XCTest
@testable import Airbnb

class DatePickerTests: XCTestCase {
    
    let datePicker = DatePicker.shared
    
    func testBothExist() {
        let inputDate = Date().addingTimeInterval(3600 * 9)
        datePicker.startDate = Date()
        datePicker.endDate = Date()
        datePicker.update(date: inputDate)
        XCTAssertEqual(inputDate, datePicker.startDate)
        XCTAssertNil(datePicker.endDate)
    }
}
