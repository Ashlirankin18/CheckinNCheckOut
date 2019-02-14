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
        label.text = "Title"
        return label
    }()
    
    public lazy var venueImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "imageHolder"))
        imageView.backgroundColor = .lightGray
        return imageView
    }()
    
    public lazy var venueSubtitle: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.text = "Subtitle"
        return label
    }()
    
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
        setSubtitleConstraints()
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
    
    private func setSubtitleConstraints() {
        self.addSubview(venueSubtitle)
        venueSubtitle.translatesAutoresizingMaskIntoConstraints = false
        venueSubtitle.topAnchor.constraint(equalTo: venueTitle.bottomAnchor).isActive = true
        venueSubtitle.leadingAnchor.constraint(equalTo: centerXAnchor, constant: -90).isActive = true
        venueSubtitle.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
}
