//
//  ListViewController.swift
//  NavApp
//
//  Created by Ashli Rankin on 2/9/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
<<<<<<< HEAD
    
    var venue = [Venues](){
        didSet {
            DispatchQueue.main.async {
                self.listView.myTableView.reloadData()
            }
=======
  
    var urlStrings = [String]()
    var venues = [VenuesInfo](){
        didSet{
            self.listView.myTableView.reloadData()
>>>>>>> e97b5dd1c8742db6567b563858409a8c89fcd323
        }
    }
    

  var listView = ListView()
  var venueId = ""
  init(venues:[VenuesInfo]){
        super.init(nibName: nil, bundle: nil)
        self.venues = venues
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(listView)
        listView.myTableView.delegate = self
        listView.myTableView.dataSource = self
      modalTransitionStyle = .coverVertical
      modalPresentationStyle = .currentContext
        view.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
      let toggle = UIBarButtonItem(title: "Map", style: .plain, target: self, action: #selector(toggleListMap))
      self.navigationItem.rightBarButtonItem = toggle
      self.navigationItem.title = "List of Places"
    }
<<<<<<< HEAD
    
    var venueInfo: Venue?
    
    
    
    private func getVenueDetails(venueId:String,date:String){
        VenueApiClient.getSpecificVenueInfo(venueId: venueId, date: date) { (error, venueInfo) in
            if let error = error {
                print(error.errorMessage())
            }
            if let venueInfo = venueInfo {
                self.venueInfo = venueInfo
                dump(venueInfo)
            }
        }
    }
=======
  
  @objc func toggleListMap(){
    dismiss(animated: true, completion: nil)
  }
  func getImagesFromPrefixandSuffix(urlString:String,imageView:UIImageView){
    if let image = ImageCache.shared.fetchImageFromCache(urlString: urlString){
      DispatchQueue.main.async {
        imageView.image = image
        
      }
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
  
  
>>>>>>> e97b5dd1c8742db6567b563858409a8c89fcd323
}

extension ListViewController : UITableViewDataSource , UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return venues.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = listView.myTableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as? ListTableViewCell else {return UITableViewCell()}
      let venue = venues[indexPath.row]
      let venueId = venue.id
      self.venueId = venue.id
      cell.venueTitle.text = venue.name
      cell.venueSubtitle.text = venue.location.formattedAddress.first
      VenueApiClient.getItemsPrefixAndSuffix(venueId: venueId, date: "20190221") { (error, items) in
        if let error = error{
          print(error.errorMessage())
        }
        if let items = items{
          let urlString = items.prefix + "300x500" + items.suffix
          DispatchQueue.main.async {
              self.getImagesFromPrefixandSuffix(urlString: urlString, imageView: cell.venueImage)
          }
        
        }
      }
      return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ListDetailViewController.init(venueId: venueId)
        let navigationController = UINavigationController(rootViewController: vc)
       self.present(navigationController, animated: true, completion: nil)
    }
    
}

