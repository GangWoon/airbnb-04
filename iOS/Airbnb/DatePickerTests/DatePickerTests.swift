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
    
    private func testReset() {
        datePicker.startDate = Date()
        datePicker.endDate = Date()
        datePicker.reset()
        XCTAssertNil(datePicker.startDate)
        XCTAssertNil(datePicker.endDate)
    }
    
    private func testBothExist() {
        datePicker.startDate = Date()
        datePicker.endDate = Date()
        datePicker.update(date: inputDate)
        XCTAssertEqual(inputDate, datePicker.startDate)
        XCTAssertNil(datePicker.endDate)
    }
    
    private func testStartNotExist() {
        datePicker.update(date: inputDate)
        XCTAssertEqual(datePicker.startDate, inputDate)
        XCTAssertNil(datePicker.endDate)
    }
    
    private func testEndDateLessThanStartDate() {
        datePicker.startDate = Date().addingTimeInterval(86400)
        datePicker.update(date: inputDate)
        XCTAssertEqual(datePicker.startDate, inputDate)
        XCTAssertNil(datePicker.endDate)
    }
    
    private func testNormalCase() {
        let startDate = Date()
        datePicker.update(date: startDate)
        datePicker.update(date: inputDate)
        XCTAssertEqual(datePicker.startDate, startDate)
        XCTAssertEqual(datePicker.endDate, inputDate)
    }
}
