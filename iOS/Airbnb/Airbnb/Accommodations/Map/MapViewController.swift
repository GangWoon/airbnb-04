//
//  MapViewController.swift
//  Airbnb
//
//  Created by Cloud on 2020/06/05.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit
import MapKit

final class MapViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var mapView: MKMapView!
    
    //MARK: - Properties
    static let identifier: String = "MapViewController"
    private var centerLocation: CLLocationCoordinate2D?
    var accommodations: [Accommodations]?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
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
            return MapAnnotation(coordinate: location, accommodations: info)
        }
        mapView.addAnnotations(array)
    }
}

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? MapAnnotation else { return nil }
        
        var view: MKMarkerAnnotationView
        
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: MapAnnotation.identifier) as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            view = MKMarkerAnnotationView(annotation: annotation,
                                          reuseIdentifier: MapAnnotation.identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: 0, y: 0)
            let callOutView = MapDetailView()
            let viewModel = AccommodationsCellViewModel(accommodations: annotation.accommodations)
            viewModel.images.append(ImageManager.load(from: annotation.accommodations.images[0])!)
            callOutView.apply(with: viewModel)
            view.detailCalloutAccessoryView = callOutView
            
            let titleLabel = UILabel()
            titleLabel.font = .systemFont(ofSize: 10)
            titleLabel.text = annotation.accommodations.name
            view.addSubview(titleLabel)
            titleLabel.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.top.equalTo(view.snp.bottom)
            }
        }
        return view
    }
}
