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
    
    
    
    var appMapView = MapView()
    var myMapView = MKMapView()
    var locationToPin = [Location]()
    let locationManager = CLLocationManager()
    let regionInMetters: Double = 10000
    let latitude: CLLocationDegrees = 40.730610
    let longitude: CLLocationDegrees = 73.935242
    let nycLocation: CLLocation = CLLocation.init(latitude:  40.730610, longitude: -73.935242)
    var previousLocation: CLLocation?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = " NAV APP "
        view.backgroundColor = .white
        view.addSubview(appMapView)
        checkLocationServices()
        butonsSetUp()
        appMapView.mapView.delegate = self 
      //  appMapView = self
    
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
        let listVC = ListViewController()
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
                // show alert instructing them how to turn on permission
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
            guard let self = self else { return }
            if let error = error {
                //TODO: Show alert informing user
                return
            }
            guard let placemarks = placemarks?.first else {
                //TODO: Show alert informing the user
                return
            }
            let streetNumber = placemarks.subThoroughfare ?? ""
            let streetName = placemarks.thoroughfare ?? ""
            self.appMapView.labelToSet.text = "\(streetNumber) \(streetName)"
          
        }
    }
}
