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
    @IBOutlet weak var mapView: MKMapView!{
        didSet {
            let coordinate = MKCoordinateRegion(center: centerLocation!, latitudinalMeters: 1000, longitudinalMeters: 1000)
            mapView.setRegion(coordinate, animated: true)
        }
    }
    
    //MARK: - Properties
    static let identifier: String = "MapViewController"
    private var centerLocation: CLLocationCoordinate2D?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBActions
    @IBAction func dismissViewController(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    // MARK: - Methods
    func updateCenterLocation(_ location: (Double, Double)) {
        centerLocation = CLLocationCoordinate2D(latitude: location.0, longitude: location.1)
    }
}
