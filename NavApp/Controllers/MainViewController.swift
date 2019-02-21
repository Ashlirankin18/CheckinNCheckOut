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
        
        mainView.seeAllEvents.addTarget(self, action: #selector(presentList), for: .touchUpInside)
        
       categoryButtonsSetup()
        

    }
    
    func categoryButtonsSetup() {
           mainView.button1.addTarget(self, action: #selector(presentCategory), for: .touchUpInside)
        mainView.button2.addTarget(self, action: #selector(presentCategory), for: .touchUpInside)
        mainView.button3.addTarget(self, action: #selector(presentCategory), for: .touchUpInside)
        mainView.button4.addTarget(self, action: #selector(presentCategory), for: .touchUpInside)
        mainView.button5.addTarget(self, action: #selector(presentCategory), for: .touchUpInside)
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
//     let allEvents = AllEventsViewController()
//        present(allEvents,animated: true,completion: nil)
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

extension MainViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let textToSet = textField.text else { return false }
        VenueApiClient.getVenues(keyword: textToSet, lattitude: "40.75", longitude: "-74", date: "20190219") { (error, venues) in
            if let error = error {
                print(error)
            } else if let venues = venues {
                        self.venues = venues
            
            }
        }
        return true
    }
   
}




