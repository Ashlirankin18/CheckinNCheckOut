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
        
        mainView.seeAllEvents.addTarget(self, action: #selector(presentList), for: .touchUpInside)
        
        
      
        

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

    

    
}


//extension MainViewController: UITextFieldDelegate {
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        if textField == mainView.secondTextField {
//
//            guard let secondTexToSet = textField.text else { return false }
//
//            let input = venues.index { $0.location.formattedAddress.first! == secondTexToSet }
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
        
        switch textField {
        case mainView.textFied:
             print("This may work ")
             let regularString = "New York"
             let urlString = regularString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
            guard let textToSet = textField.text else { return false }
             
          
             
             VenueApiClient.getVenues(keyword: textToSet, lattitude: "40.75", longitude: "-74", date: "20190220") { (error, venues) in
                if let error = error {
                    print(error)
                } else if let venues = venues {
                    self.venues = venues
                }
            }
        case mainView.secondTextField:
            print("This may work ")
            let regularString = "New York"
            let urlString = regularString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
            guard let secondTextToSet = textField.text else { return false }
            
            
            
            VenueApiClient.searchPlace(keyword: secondTextToSet, location: <#T##String#>, date: <#T##String#>, completionHandler: <#T##(AppError?, [VenuesInfo]?) -> Void#>)
        
            
        default:
            print("Yeah!")
        }
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


