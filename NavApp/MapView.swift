//
//  MapView.swift
//  NavApp
//
//  Created by Olimpia on 2/13/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

protocol MapViewDelegate: AnyObject {
    func takeMeToMap()
}

class MapView: UIView {

    lazy var buttonToMap: UIButton = {
        let buttonToMap = UIButton()
      buttonToMap.setTitle("See in map", for: .normal)
        return buttonToMap


    lazy var labelToSet: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
//        label.text = "Label goes here"
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 20 )!
        label.textColor = .black
        return label

    lazy var reviews: UILabel = {
        let reviews = UILabel()
        reviews.textAlignment = .center
        reviews.textColor = .black
        reviews.text = "review stars go here (maybe)"
        reviews.adjustsFontForContentSizeCategory = true
        reviews.numberOfLines = 0 
        return reviews

    }()
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.textAlignment = .center
        nameLabel.numberOfLines = 0
        nameLabel.adjustsFontForContentSizeCategory = true
        nameLabel.textColor = .black
        nameLabel.text = "Name of venue goes here"
        nameLabel.adjustsFontForContentSizeCategory = true
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.numberOfLines = 0
        return nameLabel
    }()
    
    lazy var addressVenue: UILabel = {
        let addressVenue = UILabel()
        addressVenue.textAlignment = .center
        addressVenue.textColor = #colorLiteral(red: 0.26, green: 0.47, blue: 0.96, alpha: 1)
        addressVenue.numberOfLines = 0
        addressVenue.adjustsFontSizeToFitWidth = true
        addressVenue.text = "Venue address goes here"
        addressVenue.adjustsFontForContentSizeCategory = true
        addressVenue.adjustsFontSizeToFitWidth = true
        return addressVenue
    }()
    
    
    lazy var venueImage: UIImageView = {
        let venueImage = UIImageView()
        let image = UIImageView(image: UIImage(named: "placeholder"))
        image.layer.cornerRadius = 10
        return image
    }()
    
    lazy var annotationView: UIView = {
        let annotationView = UIView()
        return annotationView

    }()
    
    lazy var mapPin: UIImageView = {
        let mapPin = UIImageView()
        mapPin.image = UIImage(named: "pin")
        return mapPin
    }()

    lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        return mapView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)

        
        addSubview(mapView)
        addSubview(mapPin)
        addSubview(annotationView)
        addSubview(venueImage)
        addSubview(nameLabel)
        addSubview(addressVenue)
        addSubview(buttonToMap)
        setConstrains()
    
    }
    
    func setConstrains() {
        
        mapView.translatesAutoresizingMaskIntoConstraints = false

        [mapView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40), mapView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 40), mapView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -40), mapView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -150)].forEach{ $0.isActive = true }

        [mapView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0), mapView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0), mapView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0), mapView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -65)].forEach{ $0.isActive = true }

        [mapView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0), mapView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0), mapView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0), mapView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -150)].forEach{ $0.isActive = true }

        
        mapPin.translatesAutoresizingMaskIntoConstraints = false
        [mapPin.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor), mapPin.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor)].forEach{ $0.isActive = true }

        labelToSet.translatesAutoresizingMaskIntoConstraints = false
        [labelToSet.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: 0), labelToSet.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0), labelToSet.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0), labelToSet.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0)].forEach{ $0.isActive = true }

        annotationView.translatesAutoresizingMaskIntoConstraints = false
        [annotationView.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: 0), annotationView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0), annotationView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0), annotationView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0)].forEach{ $0.isActive = true }
        
        venueImage.translatesAutoresizingMaskIntoConstraints = false
        [venueImage.centerYAnchor.constraint(equalTo: annotationView.centerYAnchor, constant: 0), venueImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 11), venueImage.bottomAnchor.constraint(equalTo: annotationView.bottomAnchor, constant: -11), venueImage.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -250)].forEach{ $0.isActive = true }
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        [nameLabel.topAnchor.constraint(equalTo: annotationView.topAnchor, constant: 11), nameLabel.leadingAnchor.constraint(equalTo: venueImage.trailingAnchor, constant: 22), nameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -22)].forEach{ $0.isActive = true }
        
        addressVenue.translatesAutoresizingMaskIntoConstraints = false
        [addressVenue.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 11), addressVenue.leadingAnchor.constraint(equalTo: venueImage.trailingAnchor, constant: 22), addressVenue.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -22)].forEach{ $0.isActive = true }

        buttonToMap.translatesAutoresizingMaskIntoConstraints = false
        [buttonToMap.topAnchor.constraint(equalTo: addressVenue.bottomAnchor, constant: 34), buttonToMap.leadingAnchor.constraint(equalTo: venueImage.trailingAnchor, constant: 22), buttonToMap.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -22)].forEach{ $0.isActive = true }

        reviews.translatesAutoresizingMaskIntoConstraints = false
        [reviews.topAnchor.constraint(equalTo: addressVenue.bottomAnchor, constant: 34), reviews.leadingAnchor.constraint(equalTo: venueImage.trailingAnchor, constant: 22), reviews.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -22)].forEach{ $0.isActive = true }


    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
