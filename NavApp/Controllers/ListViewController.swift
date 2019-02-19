//
//  ListViewController.swift
//  NavApp
//
//  Created by Ashli Rankin on 2/9/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    var venue = [Venues](){
        didSet {
            DispatchQueue.main.async {
                self.listView.myTableView.reloadData()
            }
        }
    }
    
    var listView = ListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(listView)
        listView.myTableView.delegate = self
        listView.myTableView.dataSource = self
        view.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
         getVenuesInArea(lattitude: "37.2", longitude: "44.3", date: "20190215")
    }
    
  var venueInfo: Venue?

    
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
    
    //ashliiii
    private func getTheVenueImages(cell:ListTableViewCell,urlString:String){
        
        let url = URL.init(fileURLWithPath: urlString)
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            else if let data = data {
                let images = UIImage.init(data: data)
                DispatchQueue.main.async {
                    cell.venueImage.image = images
                }
                
            }
            else if let response = response {
                print(response)
            }
        }
        
    }
}



//JOSHUA
extension ListViewController : UITableViewDataSource , UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return venue.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = listView.myTableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as? ListTableViewCell else {return UITableViewCell()}
        //Ashliiiiiiii
        let theVenue = venue[indexPath.row]
        let suffix = theVenue.response.venues[0].categories[0].icon.suffix
        //let prefix = theVenue.response.venues[indexPath.section].categories[indexPath.section].icon.prefix
        let urlString = "\(suffix)"
        getTheVenueImages(cell: cell, urlString: urlString)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let vc = ListDetailViewController()
        navigationController?.pushViewController(vc, animated: true)
        
        
        print("Dont touch me")
       
        // getvenueDetails -> give you the venue ID
        // and you use itt to call getVenueDetails
    }
    
}
