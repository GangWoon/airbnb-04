//
//  Accommodations.swift
//  Airbnb
//
//  Created by TTOzzi on 2020/05/22.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

struct Accommodations: Codable {
    var id: Int
    var images: [String]
    var name: String
    var badge: String
    var roomType: String
    var bedroomCount: String
    var rate: Double
    var reviewCount: Int
    var favorite: Bool
}
