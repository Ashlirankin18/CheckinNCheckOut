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
    
    
    var mainView = MainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(mainView)
        mainView.delegate = self
        mainView.mapButton.addTarget(self, action: #selector(presentMapView), for: .touchUpInside)
        mainView.listButton.addTarget(self, action:#selector(presentListVC), for: .touchUpInside)
        gimeMeData()
    }
    @objc func presentMapView(){
        let mapViewController = MapViewController()
        let navController = UINavigationController(rootViewController: mapViewController)
        self.present(navController, animated: true, completion: nil)
        
    }
    
    func makeAnnotations() {
        
    }
    
    
    
    @objc func presentListVC() {
        let listVC = ListViewController()
        self.present(listVC, animated: true, completion: nil)
    }
    
    func gimeMeData() {
        VenueApiClient.getVenueInformation(venueId: venueString, date: dateString) { (error, venues) in
            if let error = error {
                print(error)
            }
            
            if let venues = venues {

            }
        }
    }
    
    func zipCodeSearch(zipCode: [Location])  {
        VenueApiClient.getVenues(lattitude: latitud, longitude: longitud, date: dateString) { (error , venue) in
            if let error = error {
                print(error)
            }
            if let venue = venue {
                //pass the coordinated from the map to here 
            }
        }
    }
    
    
    
}

extension MainViewController: MainViewDelegate {
    func showObjectFromUser(keyword: String) {
        guard let keyword = mainView.textFied.text else { return }
       
        VenueApiClient.getVenues(lattitude: latitud, longitude: longitud, date: dateString) { (error, venues) in
            if let error = error {
                print(error)
            }
            if let venues = venues {
                
            }
        }
        
    }
    
    
}


