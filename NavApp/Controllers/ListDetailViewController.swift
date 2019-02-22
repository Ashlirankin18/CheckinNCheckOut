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
    
    let titleTest = "Coffeed"
    private var testVenueName = ListTableViewCell()
    
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override func viewDidLoad() {
        super.viewDidLoad()
       
      view.addSubview(listDetailView)
      view.backgroundColor = .yellow
      navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addButtonPressed))
      navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backButtonPressed))
    modalTransitionStyle = .coverVertical
    modalPresentationStyle = .currentContext
    listDetailView.VenueGroups.dataSource = self
    listDetailView.VenueGroups.delegate = self
    getPlaceInfo(venueId: venueId, date: "20190221")

    }
    @objc func addButtonPressed(){
        //testing the segue
                 let creatVC = CreateTipViewController()
                creatVC.venueBeingReviewed = titleTest
                let navController = UINavigationController(rootViewController: creatVC)
                self.present(navController, animated: true, completion: nil)
        let venueToAddToCollection = CollectionPersistanceHelper.getUserInfo()
        
    }
    
    @objc func addTipButtonPressed(){
        let creatVC = CreateTipViewController()
        creatVC.venueBeingReviewed = titleTest
        let navController = UINavigationController(rootViewController: creatVC)
        self.present(navController, animated: true, completion: nil)
    }
 
  @objc func backButtonPressed(){
    dismiss(animated: true, completion: nil)
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
          self.listDetailView.venueLocation.text = """
          \(venue.location.address)
          \(venue.location.city)
          \(venue.location.postalCode)
        """
        self.listDetailView.ContactInfo.text = """
          Facebook Name: \(venue.contact.facebookName ?? "no facebook name found")
          Facebook Contact: \(venue.contact.facebook ?? "no facebook found ")
          Instagram:  \(venue.contact.instagram ?? "no instagram found")
          Twitter: \(venue.contact.twitter ?? "no twitter found")
          Phone: \(venue.contact.formattedPhone ?? "no phone found")
          """
        }
    }
    }
  }
  
}
extension ListDetailViewController:UICollectionViewDataSource{
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if let groups = venue?.listed.groups.first?.items {
      return groups.count
    }else {
      return 1
    }
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
