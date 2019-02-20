//
//  ListViewController.swift
//  NavApp
//
//  Created by Ashli Rankin on 2/9/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    var venues = [VenuesInfo](){
        didSet{
            self.listView.myTableView.reloadData()
        }
    }
    
<<<<<<< HEAD
  var items: Items?
  var listView = ListView()
=======
    
    init(venues:[VenuesInfo]){
        super.init(nibName: nil, bundle: nil)
        self.venues = venues
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    var listView = ListView()
    var venueInfo: Venue?
>>>>>>> 3bc5074137d1c61dd2890a181e5417c274fdbc8e
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(listView)
        listView.myTableView.delegate = self
        listView.myTableView.dataSource = self
        view.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
      getVenuesInArea(lattitude: "37.2", longitude: "44.3", date: "20190215")
    }
    
<<<<<<< HEAD
  var venueInfo: Venue?
  
    
<<<<<<< HEAD
  private func getVenuesInArea(lattitude:String,longitude:String,date:String){
    VenueApiClient.getVenues(lattitude: lattitude, longitude: longitude, date: date) { (error, venue) in
      if let error = error {
        print(error.errorMessage())
      }
      if let venue = venue{
        self.venue = venue
          }
     
      }
    }
  

  
private func getTheVenueImages(venueId:String) {
    VenueApiClient.getVenueImageData(venueId: venueId, date: "20190216") { (error, items) in
=======
//  private func getVenuesInArea(lattitude:String,longitude:String,date:String){
//    VenueApiClient.getVenues(lattitude: lattitude, longitude: longitude, date: date) { (error, venue) in
//      if let error = error {
//        print(error.errorMessage())
//      }
//      if let venue = venue{
//        self.venue = venue
//        dump(venue)
//        print("I have\(venue.count) items")
//      }
//    }
//  }
=======


    

>>>>>>> 3bc5074137d1c61dd2890a181e5417c274fdbc8e
  private func getVenueDetails(venueId:String,date:String){
    VenueApiClient.getVenueInformation(venueId: venueId, date: date) { (error, venueInfo) in
>>>>>>> 5546c18028e1489c58d5ea738329a3f2afa20eb5
      if let error = error {
        print(error.errorMessage())
      }
      if let items = items {
       self.items = items

      }
    }
  }

  func getImagesFromPrefixandSuffix(prefix:String,suffix:String,imageView:UIImageView){
    let urlString = prefix + "300x500" + suffix
    if let image = ImageCache.shared.fetchImageFromCache(urlString: urlString){
      imageView.image = image
    }else{
      ImageCache.shared.fetchImageFromNetwork(urlString: urlString) { (error, image) in
        if let error = error{
          print(error.errorMessage())
        }
        if let image = image {
          DispatchQueue.main.async {
             imageView.image = image
          }
        }
        }
      }
  }
}



//JOSHUA
extension ListViewController : UITableViewDataSource , UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
<<<<<<< HEAD
      if let venue = venue.first {
        return venue.response.venues.count
      }
      return 0
=======
        return venues.count
        //getVenuesInArea
>>>>>>> 3bc5074137d1c61dd2890a181e5417c274fdbc8e
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = listView.myTableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as? ListTableViewCell else {return UITableViewCell()}
      
        let aVenue =  venue.first?.response.venues[indexPath.row]
      cell.venueTitle.text = aVenue?.name.capitalized
      cell.venueSubtitle.text = aVenue?.location.formattedAddress.first
      if let venueId  = aVenue?.id {
        //getTheVenueImages(venueId: venueId)
        if let urlComponents = items {
          //getImagesFromPrefixandSuffix(prefix: urlComponents.prefix, suffix: urlComponents.suffix, imageView: cell.venueImage)
        }else{
          print("no components found")
        }
      }
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

