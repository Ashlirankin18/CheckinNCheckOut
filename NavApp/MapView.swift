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
    
    lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        return mapView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        
        addSubview(mapView)
        setConstrains()
        
    }
    
    func setConstrains() {
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        [mapView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40), mapView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 40), mapView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -40), mapView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -150)].forEach{ $0.isActive = true }
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
