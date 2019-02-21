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
    
    var currentLocation: CLLocation? {
        didSet {
            self.makeAnnotations()
        }
    }
    var venueString = ""
    var dateString = ""
    var latitude = ""
    var longitude = ""
     var catego = [CategoryInfo]()
    var venues = [VenuesInfo]() {
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
   private var annoations = [MKAnnotation]()
    var mainView = MainView()
    var mapView = MapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(mainView)
         mainView.textFied.delegate = self
        mainView.secondTextField.delegate = self
        
    
    }
    
    @objc func presentMapView(){
        let mapViewController = MapViewController.init(annotations: annoations, venues: venues)
        let navController = UINavigationController(rootViewController: mapViewController)
        self.present(navController, animated: true, completion: nil)
    }
    
    @objc func presentCategory() {
        let categoryVC = CathegoryViewController.init(category: catego)
        let categoryController = UINavigationController(rootViewController: categoryVC)
        self.present(categoryController, animated: true, completion: nil)
        print("got a category")
        
    }
  
    
    func makeAnnotations() {
        mapView.mapView.removeAnnotations(annoations)
        annoations.removeAll()
        var ann = [MKAnnotation]()
        for vuenueToSet in venues {
            let annotation = MKPointAnnotation()
            annotation.coordinate.latitude = vuenueToSet.location.lat
            annotation.coordinate.longitude = vuenueToSet.location.lng
            annotation.title = vuenueToSet.name
            ann.append(annotation)
        }
        annoations = ann
        mapView.mapView.showAnnotations(annoations, animated: true)
    }
   
    func getVenues(lat: Double, long: Double) {
       
        guard let coorditane = currentLocation?.coordinate else { return }
        let lat = Double(coorditane.latitude)
        let long = Double(coorditane.latitude)
        
        VenueApiClient.getVenues(keyword: venueString, lattitude: lat, longitude: long, date: "20190219") { (error, venues) in
            if let error = error {
                print(error)
            } else if let venues = venues {
                self.venues = venues
            }
        }
    }
    
    func getNear() {
        
    }

    
}


extension MainViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        if let venuePlace = mainView.secondTextField
            .text {
            venueString = venuePlace
            LocationService.getCoordinate(addressString: venuePlace) { (coordinate, error) in
                if let error = error {
                    print(error)
                } else {
                    VenueApiClient.getVenues(keyword: self.mainView.textFied.text!, lattitude: coordinate.latitude, longitude: coordinate.longitude, date: "20190219", completionHandler: { (error, venues) in
                        if let error = error {
                            print(error)
                        } else if let venues = venues {
                            self.venues = venues                       }
                    })
                    
                }
            }
            
        } else {
            if let venueName = mainView.textFied.text {
                LocationService.getCoordinate(addressString: venueName) { (coordinate, error) in
                    if let error = error {
                        print(error)
                    } else {
                        VenueApiClient.getVenues(keyword: venueName, lattitude: coordinate.latitude, longitude: coordinate.longitude, date: "20190219", completionHandler: { (error, venues) in
                            if let error = error {
                                print(error)
                            } else if let venues = venues {
                                self.venues = venues
                            }
                        })
                    }
                }
               
            }
        }
       
        guard let textToSet = textField.text else { return false }
        VenueApiClient.getVenues(keyword: textToSet, lattitude: "40.75", longitude: "-74", date: "20190219") { (error, venues) in
            if let error = error {
                print(error)
            } else if let venues = venues {
              DispatchQueue.main.async {
                let mapViewController = MapViewController.init(annotations: self.annoations, venues: venues)
                let navController = UINavigationController(rootViewController: mapViewController)
                self.present(navController, animated: true, completion: nil)
              }
             
            }
        }
     
        }
    
    }


