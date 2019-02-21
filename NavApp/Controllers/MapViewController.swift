//
//  MapViewController.swift
//  NavApp
//
//  Created by Olimpia on 2/13/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {
    
    
    var annotationData = [VenuesInfo]()
    var annotations = [MKAnnotation]()
    var appMapView = MapView()
    var myMapView = MKMapView()
    var locationToPin = [Location]()
    let locationManager = CLLocationManager()
    let regionInMetters: Double = 10000
   var previousLocation: CLLocation?
    
    init(annotations: [MKAnnotation], venues: [VenuesInfo]) {
        super.init(nibName: nil, bundle: nil)
        self.annotations = annotations
        self.annotationData = venues
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = " NAV APP "
        view.backgroundColor = .white
        view.addSubview(appMapView)
        checkLocationServices()
        butonsSetUp()
        appMapView.mapView.delegate = self 
        appMapView.mapView.showAnnotations(annotations, animated: true)
        annotationViewSetUp()
        dump(annotationData)
        tapRecogSetup()
      
        
        
    }
    
    @objc func handleTap() {
       let detailedPinData = AnnotationDetailedViewController.init(vanues: annotationData)
        let navController = UINavigationController(rootViewController: detailedPinData)
        self.present(navController, animated: true, completion:  nil)
        
    }
    
    func tapRecogSetup() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap) )
        appMapView.annotationView.addGestureRecognizer(tap)
    }
    
    
    
    func annotationViewSetUp() {
        appMapView.annotationView.isHidden = true
        appMapView.addressVenue.isHidden = true
        appMapView.venueImage.isHidden = true
        appMapView.nameLabel.isHidden = true
        appMapView.reviews.isHidden = true
    }
    
    func butonsSetUp() {
        let dismiss = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(dismmisAction))
        self.navigationItem.leftBarButtonItem = dismiss
        
        let toggle = UIBarButtonItem(title: "List", style: .plain, target: self, action: #selector(toggleListMap))
        self.navigationItem.rightBarButtonItem = toggle
    }
    @objc func dismmisAction() {
        dismiss(animated: true, completion: nil)
    }
    @objc func toggleListMap() {
        let listVC = ListViewController(venues: annotationData)
        present(listVC, animated: true)
    }
    
    
    
    func setUpLocationServices() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    
    
    func centerUserOnUserLocation() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: regionInMetters, longitudinalMeters: regionInMetters)
            appMapView.mapView.setRegion(region, animated: true)
        }
    }
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setUpLocationServices()
            checkLocationAuthorization()
        } else {
            //show alert to user
        }
    }
    
    func checkLocationAuthorization() {
            switch CLLocationManager.authorizationStatus() {
            case .authorizedWhenInUse:
            trakingUserLocation()
            case .denied:
                break
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
            case .restricted:
                //show alert letting them know the tea
                break
            case .authorizedAlways:
                break
            }
        }
    
    func trakingUserLocation() {
        appMapView.mapView.showsUserLocation = true
        centerUserOnUserLocation()
        locationManager.startUpdatingLocation()
        previousLocation = getCenterLocation(for: appMapView.mapView)
    }
    
    func getCenterLocation(for myMapView: MKMapView) -> CLLocation {
        let latitud = myMapView.centerCoordinate.latitude
        let longitud = myMapView.centerCoordinate.longitude
        return CLLocation(latitude: latitud, longitude: longitud)
    }
    
}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
}

extension MapViewController: MKMapViewDelegate {

    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let center = getCenterLocation(for: mapView)
        let geoCoder = CLGeocoder()
        
        guard let previousLocation = self.previousLocation else { return }
        guard center.distance(from: previousLocation) > 50 else { return }
        self.previousLocation = center
        
        
        
        geoCoder.reverseGeocodeLocation(center) { [weak self ](placemarks, error) in
            guard self != nil else { return }
            if let error = error {
                print(error)
                //TODO: Show alert informing user
                return
            }
            guard let placemarks = placemarks?.first else {
                //TODO: Show alert informing the user
                return
            }
            let streetNumber = placemarks.subThoroughfare ?? ""
            let streetName = placemarks.thoroughfare ?? ""
            //self.appMapView.labelToSet.text = "\(streetNumber) \(streetName)"
        }
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        appMapView.annotationView.isHidden = false
        appMapView.addressVenue.isHidden = false
        appMapView.venueImage.isHidden = false
        appMapView.nameLabel.isHidden = false
        appMapView.reviews.isHidden = false
        
        guard let annotation = view.annotation else { return }
        
        let index = annotationData.index{ $0.location.lat == annotation.coordinate.latitude && $0.location.lng == annotation.coordinate.longitude }
        
        if let venueIndex = index {
        let venue = annotationData[venueIndex]
            appMapView.nameLabel.text = venue.name
            appMapView.addressVenue.text = venue.location.formattedAddress.first!
        } else {
            print("no index")
        }
        
        appMapView.mapView.deselectAnnotation(annotation, animated: true )
        
        }
    
    
    

}


