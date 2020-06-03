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
    
    private let datePicker: DatePicker = DatePicker.shared
    private let pastDate: Date = Date()
    private let futureDate: Date = Date().addingTimeInterval(86400)
    
    override func setUp() {
        super.setUp()
        datePicker.reset()
    }
    
    func testReset() {
        datePicker.startDate = pastDate
        datePicker.endDate = futureDate
        datePicker.reset()
        XCTAssertNil(datePicker.startDate)
        XCTAssertNil(datePicker.endDate)
    }
    
    func testBothExist() {
        datePicker.startDate = Date()
        datePicker.endDate = Date()
        datePicker.select(date: pastDate)
        XCTAssertEqual(pastDate, datePicker.startDate)
        XCTAssertNil(datePicker.endDate)
    }
    
    func testInputStartDate() {
        datePicker.select(date: pastDate)
        XCTAssertEqual(datePicker.startDate,
                       pastDate)
        XCTAssertNil(datePicker.endDate)
    }
    
    func testEndDateLessThanStartDate() {
        datePicker.startDate = futureDate
        datePicker.select(date: pastDate)
        XCTAssertEqual(datePicker.startDate, pastDate)
        XCTAssertNil(datePicker.endDate)
    }
    
    func testNormalCase() {
        datePicker.select(date: pastDate)
        datePicker.select(date: futureDate)
        XCTAssertEqual(datePicker.startDate, pastDate)
        XCTAssertEqual(datePicker.endDate, futureDate)
    }
    
    func testDuplicateDateSelect() {
        datePicker.select(date: pastDate)
        datePicker.select(date: pastDate)
        XCTAssertEqual(datePicker.startDate, datePicker.endDate)
    }
}
