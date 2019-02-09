//
//  ListViewController.swift
//  NavApp
//
//  Created by Ashli Rankin on 2/9/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

  var venue = [Result]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
      getVenuesInArea(date: "20190209")
    }
    
  private func getVenuesInArea(date:String){
    VenueApiClient.getVenues(date: date) { (error, venue) in
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
  
  
  }
    


