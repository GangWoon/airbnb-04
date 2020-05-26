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
                .mapError { _ in AirbnbNetworkError.error("airbnb API 에러") }
                .map { $0.data }
                .decode(type: T.self, decoder: JSONDecoder())
                .mapError { _ in .error("JSON parsing 에러") }
                .eraseToAnyPublisher()
    }
}

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
                                                images: ["1", "2", "3"],
                                                name: "좋은 집",
                                                badge: "SUPERHOST",
                                                roomType: "Entire apartment",
                                                bedroomCount: "4",
                                                rate: 4.99,
                                                reviewCount: 400,
                                                favorite: true)
            let result = Array(repeating: accommodations, count: 100) as! T
            
            return Future { promise in
                promise(.success(result))
            }
            .eraseToAnyPublisher()
    }
}

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
