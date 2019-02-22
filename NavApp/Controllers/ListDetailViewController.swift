//
//  ListDetailViewController.swift
//  NavApp
//
//  Created by Joshua Viera on 2/11/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import UIKit

class ListDetailViewController: UIViewController {
  let listDetailView = ListDetailView()
  
  var venueId = ""
  
  var venue: Venue? {
    didSet{
      DispatchQueue.main.async{
      self.listDetailView.VenueGroups.reloadData()
    }
  }
  }
  init (venueId:String){
    super.init(nibName: nil, bundle: nil)
    self.venueId = venueId
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override func viewDidLoad() {
        super.viewDidLoad()
       
      view.addSubview(listDetailView)
      view.backgroundColor = .yellow
      navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addButtonPressed))
      navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backButtonPressed))
    listDetailView.AddTipButton.addTarget(self, action: #selector(tipWasAdded), for: .touchUpInside)
    modalTransitionStyle = .coverVertical
    modalPresentationStyle = .currentContext
    listDetailView.VenueGroups.dataSource = self
    listDetailView.VenueGroups.delegate = self
    getPlaceInfo(venueId: venueId, date: "20190221")
    }
  
  @objc func tipWasAdded(){
    let creatVC = CreateTipViewController()
    creatVC.modalTransitionStyle = .crossDissolve
    creatVC.modalPresentationStyle = .currentContext
    creatVC.venueBeingReviewed = venue?.name
    let navController = UINavigationController(rootViewController: creatVC)
    self.present(navController, animated: true, completion: nil)
   
  }
    @objc func addButtonPressed(){
      let venue = FavoriteVenueCollection.init(name: (self.venue?.name)!, contents: self.venue!)
      CollectionPersistanceHelper.addItemsToDirectory(collection: venue)
      showAlert(title: "Added to collection", message: "Item was sucessfully added to collection")
      print(DataPersistenceManager.documentsDirectory())
      self.tabBarController?.selectedViewController = self.tabBarController?.viewControllers?[1]
  }
  
  @objc func backButtonPressed(){
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
  
  func getPlaceInfo(venueId:String,date:String){
    VenueApiClient.getSpecificVenueInfo(venueId: venueId, date: date) { (error, venue) in
      if let error = error{
      print(error.errorMessage())
      }
      if let venue = venue{
        self.venue = venue
        DispatchQueue.main.async {
        self.listDetailView.venueName.text = venue.name
           let address = venue.location.address ?? "No address was found for this venue"
            let city = venue.location.city ?? "no city found"
          let postalCode = venue.location.postalCode ?? "no postal code was found"
          self.listDetailView.venueLocation.text = address + " " + city + "" + postalCode
          
        self.listDetailView.ContactInfo.text = """
          Facebook Name: \(venue.contact.facebookName ?? "no facebook name found")
          Facebook Contact: \(venue.contact.facebook ?? "no facebook found ")
          Instagram:  \(venue.contact.instagram ?? "no instagram found")
          Twitter: \(venue.contact.twitter ?? "no twitter found")
          Phone: \(venue.contact.formattedPhone ?? "no phone found")
          """
          VenueApiClient.getItemsPrefixAndSuffix(venueId: venue.id, date: "20190222", completionHandler: { (error, items) in
            if let error = error {
              print(error.errorMessage())
            }
            if let items = items {
              let urlString = items.prefix + "300x500" + items.suffix
              self.getImagesFromPrefixandSuffix(urlString: urlString, imageView: self.listDetailView.venueImage)
            }
          })
          
        }
    }
    }
  }
  
}
extension ListDetailViewController:UICollectionViewDataSource{
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if let groups = venue?.listed.groups.first?.items {
        return groups.count
    }else{
    collectionView.isHidden = true
    collectionView.heightAnchor.constraint(equalToConstant: 0).isActive = true
    }
    return 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = listDetailView.VenueGroups.dequeueReusableCell(withReuseIdentifier: "GroupsCell", for: indexPath) as? GroupsCell else {fatalError("no group cell found")}
    if let venue = venue {
      let groupData = venue.listed.groups.first?.items[indexPath.row]
      cell.groupsTextView.text = """
                Group Name   \(groupData?.user.firstName ?? "no username found")
                Listed:  \(groupData?.name ?? "no name found")
                Description: \(groupData?.description ?? "no description found")
        """
    
    }
    
    return cell
    
  }
  
  
  
}
extension ListDetailViewController:UICollectionViewDelegateFlowLayout{
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize.init(width: 310, height: 300)
  }
}
