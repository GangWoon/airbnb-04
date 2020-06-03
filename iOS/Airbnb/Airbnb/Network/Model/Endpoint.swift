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
                return "/houses"
            }
        }
    }
    
    // MARK: - Properties
    private let baseURL: String = "52.78.186.18:8080/api/airbnb"
    let path: Path
    var url: URL? {
        var components = URLComponents()
        components.scheme = "http"
        components.host = baseURL
        components.path = path.description
        
        return components.url
    }
}
