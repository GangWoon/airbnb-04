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
    
    enum QueryItem: CustomStringConvertible {
        case search
        case offset
        
        var description: String {
            switch self {
            case .search:
                return "search"
            case .offset:
                return "offset"
            }
        }
    }
    
    init(path: Path, queryItems: [QueryItem: String] = [:]) {
        self.path = path
        self.queryItems = queryItems
    }
    
    // MARK: - Properties
    private let baseURL: String = "52.78.186.18:8080/api/airbnb"
    let path: Path
    let scheme: String = "http"
    let queryItems: [QueryItem: String]
    var url: URL? {
        guard !queryItems.isEmpty else { return URL(string: "\(scheme)://\(baseURL)\(path.description)") }
        var urlString = "\(scheme)://\(baseURL)\(path.description)?"
        let queryString = queryItems
            .map { "\($0)=\($1)"}
            .joined(separator: "&")
        urlString.append(queryString)
        
        return URL(string: urlString)
    }
}
