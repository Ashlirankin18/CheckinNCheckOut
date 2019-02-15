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
    
    var mapView = MapView()
    var locationToPin = [Location]()
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = " NAV APP "
        view.backgroundColor = .white
        view.addSubview(mapView)
        dataComeToMe()
        locationManager.delegate = self
        let dismiss = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(dismmisAction))
        self.navigationItem.leftBarButtonItem = dismiss
        
        let toggle = UIBarButtonItem(title: "List", style: .plain, target: self, action: #selector(toggleListMap))
        self.navigationItem.rightBarButtonItem = toggle
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
            mapView.mapView.showsUserLocation = true
            
            
        } else {
            locationManager.requestWhenInUseAuthorization()  //use by apple  //to ask the user for autorizathing
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
            mapView.mapView.showsUserLocation = true
        }
        
    }
    
    @objc func dismmisAction() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func toggleListMap() {
        
        let listVC = ListViewController()
        present(listVC, animated: true)
        
    }
    
    func dataComeToMe() {
        
    }
    
}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("User changed the authorization")
        let currentLocation = mapView.mapView.userLocation
        let myCurrentRegion = MKCoordinateRegion(center: currentLocation.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        
        mapView.mapView.setRegion(myCurrentRegion, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let currentLocation = locations.last else { return }
        let myCurrentRegion = MKCoordinateRegion(center: currentLocation.coordinate, latitudinalMeters: 100, longitudinalMeters: 100)
        mapView.mapView.setRegion(myCurrentRegion, animated: true)

    }
}

