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
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBActions
    @IBAction func dismissViewController(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
