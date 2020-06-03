//
//  Accommodations.swift
//  Airbnb
//
//  Created by TTOzzi on 2020/05/22.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

struct Accommodations: Codable, Equatable {
    
    var id: Int
    var images: [URL]
    var name: String
    var badge: Bool
    var roomType: String
    var bedRoomCount: Int
    var rate: Double
    var reviewCount: Int
    var favorite: Bool
    var latitude: Double
    var longitude: Double
    
    enum CodingKeys: String, CodingKey {
        case id = "houseId"
        case images
        case name = "houseName"
        case badge = "hostIsSuper"
        case roomType
        case bedRoomCount
        case rate
        case reviewCount
        case favorite
        case latitude
        case longitude
    }
}
