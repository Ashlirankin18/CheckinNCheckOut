//
//  FavoriteCell.swift
//  NavApp
//
//  Created by Joshua Viera on 2/8/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import UIKit

class FavoriteCell: UICollectionViewCell {
    
  
    
  let nameLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 14)
    label.textColor = UIColor.darkGray
    label.text = "Joshua Viera"
    return label
  }()
  let descriptionLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 14)
    label.textColor = .black
    label.text = "Joshua Viera"
    return label
  }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
      layer.cornerRadius = 10
      layer.borderWidth = 5
      layer.masksToBounds = true
      layer.borderColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
    }
    
    func addViews(){
        backgroundColor = .white
    
        addSubview(nameLabel)
        addSubview(descriptionLabel)
        setConstraints()
    }
    
    func setConstraints(){
        nameLabelConstraints()
      descriptionLabelConstraints()
    }
  
    func nameLabelConstraints(){
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
      nameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
      nameLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 12).isActive = true
       nameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -12).isActive = true
    }
  func descriptionLabelConstraints(){
    descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 50).isActive = true
     descriptionLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 12).isActive = true
     descriptionLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 12).isActive = true
  }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

