//
//  Endpoint.swift
//  Airbnb
//
//  Created by TTOzzi on 2020/05/22.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

protocol RequestPorviding {
    
    var url: URL? { get }
}

struct Endpoint: RequestPorviding {
    
    enum Path: CustomStringConvertible {
        case main
    
        var description: String {
            switch self {
            case .main:
                return "/main"
            }
        }
    }
    
    // MARK: - Properties
    private let baseURL: String = "api/airbnb"
    let path: Path
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = baseURL
        components.path = path.description
        
        return components.url
    }
}
