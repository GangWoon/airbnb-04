//
//  AirbnbNetworkImpl.swift
//  Airbnb
//
//  Created by TTOzzi on 2020/05/25.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation
import Combine

struct AirbnbNetworkImpl: AirbnbNetwork {
    
    // MARK: - Properties
    var session: URLSession
    
    // MARK: - Lifecycle
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    // MARK: - Methods
    func request<T>(_ type: T.Type, requestProviding: RequestPorviding) -> AnyPublisher<T, AirbnbNetworkError>
        where T : Decodable {
            guard let url = requestProviding.url else {
                return Fail(error: .error("유효하지 않은 URL"))
                    .eraseToAnyPublisher()
            }
            
            return session.dataTaskPublisher(for: url)
                .mapError { error in AirbnbNetworkError.error("\(error)") }
                .map { $0.data }
                .decode(type: T.self, decoder: JSONDecoder())
                .mapError { error in .error("\(error)") }
                .eraseToAnyPublisher()
    }
}
