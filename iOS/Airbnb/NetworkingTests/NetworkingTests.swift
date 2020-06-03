//
//  NetworkingTests.swift
//  NetworkingTests
//
//  Created by Cloud on 2020/06/02.
//  Copyright © 2020 Cloud. All rights reserved.
//

import XCTest
import Combine
@testable import Airbnb

final class NetworkingTests: XCTestCase {
    
    private var subscription: AnyCancellable?
    private var accommodations = Accommodations(id: 1,
                                                images: ["1", "2", "3"],
                                                name: "좋은 집",
                                                badge: "SUPERHOST",
                                                roomType: "Entire apartment",
                                                bedroomCount: "4",
                                                rate: 4.99,
                                                reviewCount: 400,
                                                favorite: true)
    private var dummy: [Accommodations]!
    
    override func setUp() {
        super.setUp()
        dummy = Array(repeating: accommodations, count: 100)
    }
    
    func testSuccessNetworking() {
        let network = AirbnbMockNetworkSuccessImpl()
        let expectation = XCTestExpectation()
        defer { wait(for: [expectation], timeout: 2) }
        subscription = network.request([Accommodations].self,
                                       requestProviding: Endpoint(path: .main))
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    expectation.fulfill()
                default:
                    XCTFail()
                }
            }) { response in
                XCTAssertEqual(response, self.dummy)
        }
    }
    
    func testFailNetworking() {
        let network = AirbnbMockNetworkFailImpl()
        let expectation = XCTestExpectation()
        defer { wait(for: [expectation], timeout: 2) }
        subscription = network.request([Accommodations].self,
                                       requestProviding: Endpoint(path: .main))
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    XCTFail()
                default:
                    expectation.fulfill()
                }
            }) { _ in XCTFail() }
    }
}
