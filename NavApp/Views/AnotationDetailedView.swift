//
//  AnotationView.swift
//  NavApp
//
//  Created by Olimpia on 2/20/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import UIKit

class AnotationDetailedView: UIView {
    
    
    
    lazy var nameLabel: UILabel = {
    let nameLabel = UILabel()
        nameLabel.text = "name of venue"
        nameLabel.textAlignment = .center
        nameLabel.numberOfLines = 0
        nameLabel.font = UIFont(name: "GillSans-Italic", size: 34)
        nameLabel.adjustsFontSizeToFitWidth = true
        return nameLabel
    }()
    
    lazy var addressLable: UILabel = {
        let addressLable = UILabel()
        addressLable.text = "name of venue"
        addressLable.textAlignment = .center
        addressLable.numberOfLines = 0
        addressLable.font = UIFont(name: "GillSans-Italic", size: 24)
        addressLable.textColor = #colorLiteral(red: 0, green: 0.4117647059, blue: 0.8509803922, alpha: 1)
        addressLable.adjustsFontSizeToFitWidth = true
        return addressLable
    }()
    
    
    
    lazy var venuePicture: UIImageView = {
        let venuePicture = UIImageView()
        let image = UIImageView(image: UIImage(named: "placeholder"))
        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        backgroundColor = .white
        addViews()
        addConstrains()
        backgroundColor = #colorLiteral(red: 0.9427238107, green: 0.8567539454, blue: 0.7658753991, alpha: 1)
    }
    
    func addViews() {
        addSubview(nameLabel)
        addSubview(venuePicture)
        addSubview(addressLable)
        
    }
    
    func addConstrains() {
       nameLabel.translatesAutoresizingMaskIntoConstraints = false
        [nameLabel.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.35),nameLabel.bottomAnchor.constraint(equalTo: venuePicture.topAnchor, constant: -22), nameLabel.centerXAnchor.constraint(equalTo: venuePicture.centerXAnchor), nameLabel.centerYAnchor.constraint(equalTo: venuePicture.centerYAnchor)].forEach{ $0.isActive = true }
        
        venuePicture.translatesAutoresizingMaskIntoConstraints = false
        [venuePicture.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor), venuePicture.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor), venuePicture.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.25), venuePicture.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.50)].forEach{ $0.isActive = true }
        
        addressLable.translatesAutoresizingMaskIntoConstraints = false
        [addressLable.topAnchor.constraint(equalTo: venuePicture.bottomAnchor, constant: 44), addressLable.centerXAnchor.constraint(equalTo: venuePicture.centerXAnchor), addressLable.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.25)].forEach{ $0.isActive = true }
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
