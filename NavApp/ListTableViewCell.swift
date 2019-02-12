//
//  ListTableViewCell.swift
//  NavApp
//
//  Created by Joshua Viera on 2/11/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    public lazy var venueTitle: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.text = "Venue:"
        return label
    }()
    
    public lazy var venueImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "imageHolder"))
        imageView.backgroundColor = .lightGray
        return imageView
    }()
    
    public lazy var favoriteButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .yellow
        button.layer.cornerRadius = 18
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(favoriteButtonPressed), for: .touchUpInside)
        return button
    }()
    
    
    @objc func favoriteButtonPressed() {
   //send to favorites Array
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setTitleConstraints()
        setImageConstraints()
        setButtonConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension ListTableViewCell{
    private func setImageConstraints() {
        self.addSubview(venueImage)
        venueImage.translatesAutoresizingMaskIntoConstraints = false
        venueImage.topAnchor.constraint(equalTo: topAnchor, constant: 6).isActive = true
        venueImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        venueImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -6).isActive = true
        venueImage.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 12).isActive = true
    }
    
    private func setTitleConstraints(){
        self.addSubview(venueTitle)
        venueTitle.translatesAutoresizingMaskIntoConstraints = false
        venueTitle.leadingAnchor.constraint(equalTo: centerXAnchor, constant: -90).isActive = true
        venueTitle.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        venueTitle.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        venueTitle.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    private func setButtonConstraints() {
        self.addSubview(favoriteButton)
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        favoriteButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        favoriteButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        favoriteButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        favoriteButton.widthAnchor.constraint(equalToConstant:50).isActive = true
        favoriteButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
