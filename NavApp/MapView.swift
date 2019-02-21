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

class MapView: UIView {
    

    lazy var labelToSet: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
//        label.text = "Label goes here"
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 20 )!
        label.textColor = .black
        return label
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
        addSubview(labelToSet)
        setConstrains()
    
    }
    
    func setConstrains() {
        
        mapView.translatesAutoresizingMaskIntoConstraints = false

        [mapView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40), mapView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 40), mapView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -40), mapView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -150)].forEach{ $0.isActive = true }

        [mapView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0), mapView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0), mapView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0), mapView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -65)].forEach{ $0.isActive = true }
        
        mapPin.translatesAutoresizingMaskIntoConstraints = false
        [mapPin.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor), mapPin.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor)].forEach{ $0.isActive = true }
        
        labelToSet.translatesAutoresizingMaskIntoConstraints = false
        [labelToSet.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: 0), labelToSet.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0), labelToSet.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0), labelToSet.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0)].forEach{ $0.isActive = true }

        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
