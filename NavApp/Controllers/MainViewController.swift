//
//  MainViewController.swift
//  NavApp
//
//  Created by Ashli Rankin on 2/8/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//
import UIKit
import MapKit

class MainViewController: UIViewController {
    var venueString = ""
    var dateString = ""
    var latitud = ""
    var longitud = ""

    var venues = [Venue]() {
        didSet {
            DispatchQueue.main.async {
                self.makeAnnotations()
            }
        }
    }
    
    var location = [Location]() {
        didSet {
            DispatchQueue.main.async {
            
            }
        }
    }
   private var annoation = [MKAnnotation]()
    var mainView = MainView()
    var mapView = MapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(mainView)
        mainView.mapButton.addTarget(self, action: #selector(presentMapView), for: .touchUpInside)
        mainView.listButton.addTarget(self, action:#selector(presentListVC), for: .touchUpInside)
       
        mainView.textFied.delegate = self
    }
    @objc func presentMapView(){
        let mapViewController = MapViewController()
        let navController = UINavigationController(rootViewController: mapViewController)
        self.present(navController, animated: true, completion: nil)
        
    }
    
    func makeAnnotations() {
        mapView.mapView.removeAnnotations(annoation)
        annoation.removeAll()
        for vuenueToSet in venues {
            let annotation = MKPointAnnotation()
            annotation.coordinate.latitude = vuenueToSet.response.venue.location.unsafelyUnwrapped.lat
            annotation.coordinate.longitude = vuenueToSet.response.venue.location.unsafelyUnwrapped.lng
            annotation.title = vuenueToSet.response.venue.name
        
        }
        mapView.mapView.showAnnotations(annoation, animated: true)
    }
    
    
    
    @objc func presentListVC() {
        let listVC = ListViewController()
        self.present(listVC, animated: true, completion: nil)
    }


    
}

extension MainViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let textToSet = textField.text else { return false }
        
        return true
    }
   
}




