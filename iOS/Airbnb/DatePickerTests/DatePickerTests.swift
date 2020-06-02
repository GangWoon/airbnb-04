//
//  DatePickerTests.swift
//  DatePickerTests
//
//  Created by Cloud on 2020/06/02.
//  Copyright © 2020 Cloud. All rights reserved.
//

import XCTest
@testable import Airbnb

final class DatePickerTests: XCTestCase {
    
    private let datePicker = DatePicker.shared
    private let inputDate = Date().addingTimeInterval(3600 * 9)
    
    override func setUp() {
        super.setUp()
        datePicker.reset()
    }
    
    func testReset() {
        datePicker.startDate = Date()
        datePicker.endDate = Date()
        datePicker.reset()
        XCTAssertNil(datePicker.startDate)
        XCTAssertNil(datePicker.endDate)
    }
    
    func testBothExist() {
        datePicker.startDate = Date()
        datePicker.endDate = Date()
        datePicker.update(date: inputDate)
        XCTAssertEqual(inputDate, datePicker.startDate)
        XCTAssertNil(datePicker.endDate)
    }
    
    func testStartNotExist() {
        datePicker.update(date: inputDate)
        XCTAssertEqual(datePicker.startDate, inputDate)
        XCTAssertNil(datePicker.endDate)
    }
}
