//
//  ListViewController.swift
//  NavApp
//
//  Created by Ashli Rankin on 2/9/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
 
  var venue = [Venues]()
  var venueInfo: Venue?
  
    override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = .blue
       
       
        title = "NAV APP"
        let dismiss = UIBarButtonItem(title: "map", style: .plain, target: self, action: #selector(toggleToMap))
        self.navigationItem.rightBarButtonItem = dismiss
       

        
        
    //  getVenuesInArea(lattitude: "40.7", longitude: "-74", date: "20190215")
    // getVenueDetails(venueId: "4bddccbe6198c9b67bb911ff", date: "20190211")
    }
    
    @objc func toggleToMap() {
        let mapCV = MapViewController()
        present(mapCV, animated: true)
    }
    
  private func getVenuesInArea(lattitude:String,longitude:String,date:String){
    VenueApiClient.getVenues(lattitude: lattitude, longitude: longitude, date: date) { (error, venue) in
      if let error = error {
        print(error.errorMessage())
      }
      if let venue = venue{
        self.venue = venue
        dump(venue)
        print("I have\(venue.count) items")
      }
    }
  }
  private func getVenueDetails(venueId:String,date:String){
    VenueApiClient.getVenueInformation(venueId: venueId, date: date) { (error, venueInfo) in
      if let error = error {
        print(error.errorMessage())
      }
      if let venueInfo = venueInfo {
        self.venueInfo = venueInfo
        dump(venueInfo)
      }
    }
  }
}





