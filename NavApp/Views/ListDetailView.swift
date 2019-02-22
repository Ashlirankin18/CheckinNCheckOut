//
//  ListDetailView.swift
//  NavApp
//
//  Created by Joshua Viera on 2/14/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import UIKit

class ListDetailView: UIView {

    
    //venue name
  lazy var DetailledScrollView:UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.contentSize.height = 1000
    scrollView.backgroundColor = #colorLiteral(red: 0.7362746098, green: 0.77075699, blue: 1, alpha: 1)
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    return scrollView
  }()
  
    lazy var venueName: UILabel = {
        let name = UILabel()
        name.text = "Joshua"
        name.textColor = .black
        name.textAlignment = .center
      name.backgroundColor = #colorLiteral(red: 0.9328603371, green: 0.9755296445, blue: 1, alpha: 1)
        name.font = UIFont.boldSystemFont(ofSize: 20)
      name.numberOfLines = 0
      name.adjustsFontSizeToFitWidth = true
      name.layer.cornerRadius = 10
      name.layer.masksToBounds = true
        return name
    }()
    
    //TODO chnage Name
    lazy var venueLocation: UILabel = {
        let name = UILabel()
        name.text = "Joshua"
        name.textColor = .black
        name.textAlignment = .center
        name.backgroundColor = #colorLiteral(red: 0.9328603371, green: 0.9755296445, blue: 1, alpha: 1)
        name.font = UIFont.boldSystemFont(ofSize: 16)
       name.numberOfLines = 0
       name.adjustsFontSizeToFitWidth = true
      name.layer.cornerRadius = 10
       name.layer.masksToBounds = true
        return name
    }()
    //TODO chnage Name
    lazy var VenueGroups: UICollectionView = {
      let layout = UICollectionViewFlowLayout()
      layout.scrollDirection = .horizontal
      layout.sectionInset = UIEdgeInsets.init(top: 30, left: 10, bottom: 30, right: 10)
      let collectionView = UICollectionView(frame: self.frame, collectionViewLayout: layout)
      collectionView.register(GroupsCell.self, forCellWithReuseIdentifier: "GroupsCell")
      collectionView.backgroundColor = #colorLiteral(red: 0.7362746098, green: 0.77075699, blue: 1, alpha: 1)
      collectionView.layer.cornerRadius = 10
      collectionView.layer.masksToBounds = true
      collectionView.layer.borderColor = UIColor.gray.cgColor
      
        return collectionView
    }()
    //TODO chnage Name
    lazy var ContactInfo: UILabel = {
      let name = UILabel()
      name.text = "Joshua"
      name.textColor = .black
      name.textAlignment = .left
      name.font = UIFont.boldSystemFont(ofSize: 16)
      name.backgroundColor = #colorLiteral(red: 0.9328603371, green: 0.9755296445, blue: 1, alpha: 1)
      name.adjustsFontSizeToFitWidth = true
      name.numberOfLines = 0
      name.adjustsFontForContentSizeCategory = true
      name.layer.cornerRadius = 10
       name.layer.masksToBounds = true
      name.textAlignment = .center
        return name
    }()
  lazy var AddTipButton: UIButton = {
    let name = UIButton()
    name.setTitle("Add Tip", for: .normal)
    name.backgroundColor = .white
    name.setTitleColor(.black, for: .normal)
    name.layer.cornerRadius = 10
    name.layer.masksToBounds = true
    name.layer.borderWidth = 10
    name.layer.borderColor = UIColor.gray.cgColor
    return name
  }()
    
     lazy var venueImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "imageHolder"))
        imageView.backgroundColor = .lightGray
      imageView.layer.masksToBounds = true
      imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit(){
        setConstraints()
    }
    
}
extension ListDetailView {
    
    private func setConstraints() {
      setScrollViewConstraints()

    }
  
  func setScrollViewConstraints(){
    addSubview(DetailledScrollView)
    DetailledScrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    DetailledScrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    DetailledScrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    DetailledScrollView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
  setVenueImageConstraints()
   setVenueNameConstraints()
   setVenueLocationConstraint()
   setVenueGroupConstraint()
    setContactInfoConstraint()
    setAddTipConstraint()
  }
    
    func setVenueImageConstraints(){
        DetailledScrollView.addSubview(venueImage)
        venueImage.translatesAutoresizingMaskIntoConstraints = false
       venueImage.centerXAnchor.constraint(equalTo: DetailledScrollView.centerXAnchor).isActive = true
        venueImage.topAnchor.constraint(equalTo: DetailledScrollView.topAnchor, constant: 10).isActive = true
        venueImage.widthAnchor.constraint(equalToConstant: 300).isActive = true
      venueImage.heightAnchor.constraint(equalToConstant: 300).isActive = true
    }
    
    func setVenueNameConstraints(){
        DetailledScrollView.addSubview(venueName)
        venueName.translatesAutoresizingMaskIntoConstraints = false
       venueName.topAnchor.constraint(equalTo: venueImage.bottomAnchor, constant: 10).isActive = true
      venueName.leadingAnchor.constraint(equalTo: DetailledScrollView.leadingAnchor, constant: 30).isActive = true
        venueName.heightAnchor.constraint(equalToConstant: 40).isActive = true
      venueName.widthAnchor.constraint(equalToConstant: 350).isActive = true
      
    }
    
    func setVenueLocationConstraint(){
        DetailledScrollView.addSubview(venueLocation)
        venueLocation.translatesAutoresizingMaskIntoConstraints = false
        venueLocation.topAnchor.constraint(equalTo: venueName.bottomAnchor, constant: 10).isActive = true
        venueLocation.leadingAnchor.constraint(equalTo: DetailledScrollView.leadingAnchor, constant: 30).isActive = true
        venueLocation.widthAnchor.constraint(equalToConstant: 350).isActive = true
        venueLocation.heightAnchor.constraint(equalToConstant: 50).isActive = true
      
    }
    
    func setVenueGroupConstraint(){
       DetailledScrollView.addSubview(VenueGroups)
        VenueGroups.translatesAutoresizingMaskIntoConstraints = false
        VenueGroups.topAnchor.constraint(equalTo: venueLocation.bottomAnchor, constant: 10).isActive = true
      VenueGroups.widthAnchor.constraint(equalToConstant: 350).isActive = true
      VenueGroups.heightAnchor.constraint(equalToConstant: 250).isActive = true
      VenueGroups.leadingAnchor.constraint(equalTo: DetailledScrollView.leadingAnchor, constant: 30).isActive = true
    }
    
    func setContactInfoConstraint(){
        DetailledScrollView.addSubview(ContactInfo)
        ContactInfo.translatesAutoresizingMaskIntoConstraints = false
      ContactInfo.topAnchor.constraint(equalTo: VenueGroups.bottomAnchor, constant: 20).isActive = true
      ContactInfo.leadingAnchor.constraint(equalTo: DetailledScrollView.leadingAnchor, constant: 30).isActive = true
      ContactInfo.widthAnchor.constraint(equalToConstant: 350).isActive = true
      ContactInfo.heightAnchor.constraint(equalToConstant: 160).isActive = true
    }
  func setAddTipConstraint(){
    DetailledScrollView.addSubview(AddTipButton)
    AddTipButton.translatesAutoresizingMaskIntoConstraints = false
    AddTipButton.topAnchor.constraint(equalTo: ContactInfo.bottomAnchor, constant: 15).isActive = true
    AddTipButton.trailingAnchor.constraint(equalTo: ContactInfo.trailingAnchor, constant: -30).isActive = true
    AddTipButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
    AddTipButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
  }
    

}
