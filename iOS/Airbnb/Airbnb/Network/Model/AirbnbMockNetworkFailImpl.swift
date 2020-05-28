//
//  AirbnbMockNetworkFailImpl.swift
//  Airbnb
//
//  Created by TTOzzi on 2020/05/28.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation
import Combine

struct AirbnbMockNetworkFailImpl: AirbnbNetwork {
    
    // MARK: - Properties
    var session: URLSession
    
    // MARK: - Lifecycle
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    // MARK: - Methods
    func request<T>(_ type: T.Type, requestProviding: RequestPorviding) -> AnyPublisher<T, AirbnbNetworkError>
        where T : Decodable {
    
            return Future { promise in
                promise(.failure(.error("에러 발생!")))
            }
            .eraseToAnyPublisher()
    }
}
