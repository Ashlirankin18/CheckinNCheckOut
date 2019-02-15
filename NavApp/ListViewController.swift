//
//  ListViewController.swift
//  NavApp
//
//  Created by Ashli Rankin on 2/9/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
  var listView = ListView()
  var venue = [Venues]()
  var venueInfo: Venue?
  
    override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = .blue
        view.addSubview(listView)
        self.listView.tableView.register(ListCell.self, forCellReuseIdentifier: "ListCell")
        listView.tableView.delegate = self
        listView.tableView.dataSource = self
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

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = listView.tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as? ListCell else { return UITableViewCell() }
//        let dataToSet = venue[indexPath.row]
//        cell.detailTextLabel?.text = dataToSet.response.venues.first!.id
         return cell
    }
    
    
}



