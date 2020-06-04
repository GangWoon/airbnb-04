//
//  AirbnbMockNetworkSuccessImpl.swift
//  Airbnb
//
//  Created by TTOzzi on 2020/05/28.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation
import Combine

struct AirbnbMockNetworkSuccessImpl: AirbnbNetwork {
    
    // MARK: - Properties
    var session: URLSession
    
    // MARK: - Lifecycle
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    // MARK: - Methods
    func request<T>(_ type: T.Type, requestProviding: RequestPorviding) -> AnyPublisher<T, AirbnbNetworkError>
        where T : Decodable {
            let accommodations = Accommodations(id: 1,
                                                images: [],
                                                name: "좋은 집",
                                                badge: true,
                                                roomType: "Entire apartment",
                                                bedRoomCount: 4,
                                                rate: 4.99,
                                                reviewCount: 400,
                                                favorite: true,
                                                latitude: 123.456,
                                                longitude: 99.99)
            let result = Array(repeating: accommodations, count: 100) as! T
            
            return Future { promise in
                promise(.success(result))
            }
            .eraseToAnyPublisher()
    }
}
