//
//  MapAnnotation.swift
//  Airbnb
//
//  Created by Cloud on 2020/06/05.
//  Copyright © 2020 Cloud. All rights reserved.
//

import MapKit

final class MapAnnotation: NSObject, MKAnnotation {
    
    // MARK: - Properties
    static let identifier: String = "MapAnnotation"
    let accommodations: Accommodations
    let coordinate: CLLocationCoordinate2D
    
    // MARK: - Lifecycle
    init(coordinate: CLLocationCoordinate2D, accommodations: Accommodations) {
        self.coordinate = coordinate
        self.accommodations = accommodations
    }
}
