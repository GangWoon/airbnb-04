//
//  AirbnbNetworkImpl.swift
//  Airbnb
//
//  Created by TTOzzi on 2020/05/25.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation
import Combine

class AirbnbNetworkImpl: AirbnbNetwork {
    
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func request<T>(_ type: T, requestProviding: RequestPorviding) -> AnyPublisher<T, AirbnbNetworkError>
        where T : Decodable {
            guard let url = requestProviding.url else {
                return Fail(error: .error("유효하지 않은 URL"))
                    .eraseToAnyPublisher()
            }
            
            return session.dataTaskPublisher(for: url)
                .mapError { _ in AirbnbNetworkError.error("airbnb API 에러") }
                .map { $0.data }
                .decode(type: T.self, decoder: JSONDecoder())
                .mapError { _ in .error("JSON parsing 에러") }
                .eraseToAnyPublisher()
    }
}
