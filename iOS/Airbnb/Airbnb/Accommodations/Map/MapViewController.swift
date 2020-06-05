//
//  MapViewController.swift
//  Airbnb
//
//  Created by Cloud on 2020/06/05.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var mapView: MKMapView!
    
    //MARK: - Properties
    static let identifier: String = "MapViewController"
    private var centerLocation: CLLocationCoordinate2D?
    var accommodations: [Accommodations]?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setCenterLocation()
        addAnnotations()
    }
    
    // MARK: - IBActions
    @IBAction func dismissViewController(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    // MARK: - Methods
    func updateCenterLocation(_ location: (Double, Double)) {
        centerLocation = CLLocationCoordinate2D(latitude: location.0, longitude: location.1)
    }
    
    private func setCenterLocation() {
        let coordinate = MKCoordinateRegion(center: centerLocation!, latitudinalMeters: 2000, longitudinalMeters: 2000)
        mapView.setRegion(coordinate, animated: true)
    }
    
    private func addAnnotations() {
        guard let accommodations = accommodations else { return }
        let array = accommodations.map { info -> MapAnnotation in
            let location = CLLocationCoordinate2D(latitude: info.latitude, longitude: info.longitude)
            return MapAnnotation(coordinate: location, title: info.name)
        }
        mapView.addAnnotations(array)
    }
}
