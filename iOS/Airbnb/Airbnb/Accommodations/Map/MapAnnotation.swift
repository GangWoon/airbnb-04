//
//  MapAnnotation.swift
//  Airbnb
//
//  Created by Cloud on 2020/06/05.
//  Copyright © 2020 Cloud. All rights reserved.
//

import MapKit

class MapAnnotation: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String) {
        self.coordinate = coordinate
        self.title = title
    }
}
