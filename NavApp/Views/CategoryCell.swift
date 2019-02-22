//
//  CategoryCell.swift
//  NavApp
//
//  Created by Olimpia on 2/21/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {
    
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
      
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

 
