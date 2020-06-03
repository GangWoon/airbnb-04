//
//  AgeGroup.swift
//  Airbnb
//
//  Created by Cloud on 2020/06/02.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

protocol Informationable {
    
    var category: String { get }
    var description: String { get }
}

enum AgeGroup: Informationable {
    
    case adult
    case youth
    case infant
    
    var category: String {
        switch self {
        case .adult:
            return "성인"
        case .youth:
            return "청소년"
        case .infant:
            return "영유아"
        }
    }
    
    var description: String {
        switch self {
        case .adult:
            return "만13세 이상"
        case .youth:
            return "만3세 ~ 만12세"
        case .infant:
            return "만2세 이하"
        }
    }
}
