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
    lazy var venueName: UILabel = {
        let name = UILabel()
        name.text = "Joshua"
        name.textColor = .black
        name.textAlignment = .center
        name.font = UIFont.boldSystemFont(ofSize: 40)
        return name
    }()
    
    //TODO chnage Name
    lazy var a: UILabel = {
        let name = UILabel()
        name.text = "Joshua"
        name.textColor = .black
        name.textAlignment = .center
        name.font = UIFont.boldSystemFont(ofSize: 40)
        return name
    }()
    //TODO chnage Name
    lazy var b: UILabel = {
        let name = UILabel()
        name.text = "Joshua"
        name.textColor = .black
        name.textAlignment = .center
        name.font = UIFont.boldSystemFont(ofSize: 40)
        return name
    }()
    //TODO chnage Name
    lazy var c: UILabel = {
        let name = UILabel()
        name.text = "Joshua"
        name.textColor = .black
        name.textAlignment = .center
        name.font = UIFont.boldSystemFont(ofSize: 40)
        return name
    }()
    
    public lazy var venueImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "imageHolder"))
        imageView.backgroundColor = .lightGray
        return imageView
    }()
    
    lazy var createTipButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add Tip", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        button.layer.cornerRadius = 5.0
        return button
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
        setVenueNameConstraints()
        setAConstraint()
        setBConstraint()
        setCConstraint()
        setVenueImageConstraints()
        setAddTipButtonConstraints()
    }
    
    func setVenueImageConstraints(){
        addSubview(venueImage)
        venueImage.translatesAutoresizingMaskIntoConstraints = false
        venueImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        venueImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        venueImage.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        venueImage.bottomAnchor.constraint(equalTo: venueName.topAnchor).isActive = true
        
    }
    
    func setVenueNameConstraints(){
        addSubview(venueName)
        venueName.translatesAutoresizingMaskIntoConstraints = false
        //        venueName.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        NSLayoutConstraint(item: venueName, attribute: .centerY, relatedBy: .equal , toItem: self, attribute: .centerY, multiplier: 1.2, constant: 0).isActive = true
        
        venueName.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        venueName.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    func setAConstraint(){
        addSubview(a)
        a.translatesAutoresizingMaskIntoConstraints = false
        a.topAnchor.constraint(equalTo: venueName.bottomAnchor).isActive = true
        a.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        a.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    func setBConstraint(){
        addSubview(b)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.topAnchor.constraint(equalTo: a.bottomAnchor).isActive = true
        b.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        b.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    func setCConstraint(){
        addSubview(c)
        c.translatesAutoresizingMaskIntoConstraints = false
        c.topAnchor.constraint(equalTo: b.bottomAnchor).isActive = true
        c.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        c.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    func setAddTipButtonConstraints() {
        addSubview(createTipButton)
        createTipButton.translatesAutoresizingMaskIntoConstraints = false
        createTipButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -11).isActive = true
        createTipButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -11).isActive = true
    }

}
