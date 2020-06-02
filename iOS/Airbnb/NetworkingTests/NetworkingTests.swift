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

class NetworkingTests: XCTestCase {
    
    var subscription: AnyCancellable?
    var accommodations = Accommodations(id: 1,
                                        images: ["1", "2", "3"],
                                        name: "좋은 집",
                                        badge: "SUPERHOST",
                                        roomType: "Entire apartment",
                                        bedroomCount: "4",
                                        rate: 4.99,
                                        reviewCount: 400,
                                        favorite: true)
    
    
    func testSuccessNetworking() {
        let dummy = Array(repeating: accommodations, count: 100)
        let network = AirbnbMockNetworkSuccessImpl()
        let expectation = XCTestExpectation()
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
                XCTAssertEqual(response, dummy)
        }
        
        wait(for: [expectation], timeout: 2)
    }
}
