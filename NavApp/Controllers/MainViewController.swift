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
//            getVenues(lat: <#Double#>, long: <#Double#>)
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
        mainView.mapButton.addTarget(self, action: #selector(presentMapView), for: .touchUpInside)
        mainView.listButton.addTarget(self, action:#selector(presentListVC), for: .touchUpInside)
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
    
    @objc func presentList() {

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
    
    
    
    @objc func presentListVC() {
        let listVC = ListViewController(venues: venues)
        let listNavigation = UINavigationController(rootViewController: listVC)
        self.present(listNavigation, animated: true, completion: nil)
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


//extension MainViewController: UITextFieldDelegate {
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        if textField == mainView.secondTextField {
//
//            guard let secondTexToSet = textField.text else { return false }
//
//
//
//        VenueApiClient.getVenues(keyword: "\(String(describing: input))", lattitude: "40.75", longitude: "-74", date: "20190219") { (error, venues) in
//                if let error = error {
//                   print(error)
//                } else if let venues = venues {
//                    self.venues = venues
//                }
//            }
//
//
//        } else {
//            guard let textToSet = textField.text else { return false }
//            VenueApiClient.getVenues(keyword: textToSet, lattitude: "40.75", longitude: "-74", date: "20190219") { (error, venues) in
//                if let error = error {
//                    print(error)
//                } else if let venues = venues {
//                    self.venues = venues
//
//                }
//            }
//
//        }
//        return true
//    }
//
//}


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
        
        
//        switch textField {
//        case mainView.textFied:
//             let regularString = "New York"
//             let urlString = regularString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
//            guard let textToSet = textField.text else { return false }
//             VenueApiClient.getVenues(keyword: textToSet, lattitude: "40.75", longitude: "-74", date: "20190220") { (error, venues) in
//                if let error = error {
//                    print(error)
//                } else if let venues = venues {
//
//                    self.venues = venues
//                }
//            }
//        case mainView.secondTextField:
//            print("This may work ")
//            let regularString = "New York"
//            let urlString = regularString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
//
//            guard let secondTextToSet = textField.text else { return false }
//            guard let keyword = textField.text else { return false
//
//            }
            
//            VenueApiClient.searchPlace(keyword: keyword, location: secondTextToSet, date: "20190220") { (error, venues) in
//                if let error = error {
//                    print(error)
//                } else if let venues = venues {
//                    self.venues = venues
//                }
//            }
//
//
//        default:
//            print("Yeah!")
//        }
//         if textField == mainView.textFied {
//
//            guard let textToSet = textField.text else { return false }
//            VenueApiClient.searchPlace(keyword: textToSet, location: <#T##String#>, date: <#T##String#>) { (error, venues) in
//                if let error = error {
//                    print(error)
//                } else if let venues = venues {
//                    self.venues = venues
//                }
//            }
//
//        }
        return true
        }
    
    }


