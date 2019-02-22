//
//  GroupsCell.swift
//  NavApp
//
//  Created by Ashli Rankin on 2/21/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import UIKit

class GroupsCell: UICollectionViewCell {
  
  lazy var groupsTextView:UITextView = {
    let textView = UITextView()
    textView.backgroundColor = .white
    textView.text = "This is a test"
    textView.isEditable = false
    textView.isSelectable = false
    textView.isScrollEnabled = false
    textView.textColor = .black
    textView.font = UIFont.boldSystemFont(ofSize: 18)
    textView.textAlignment = .center
    return textView
  }()
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }
  
  func commonInit(){
    setUpView()
    backgroundColor = #colorLiteral(red: 0.9328603371, green: 0.9755296445, blue: 1, alpha: 1)
    layer.borderWidth = 10
    layer.borderColor = UIColor.gray.cgColor
  }
  
}
extension GroupsCell{
  
  func setUpView(){
    setUpTextViewConstraint()
  }
  
  func setUpTextViewConstraint(){
    addSubview(groupsTextView)
    groupsTextView.translatesAutoresizingMaskIntoConstraints = false
    groupsTextView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    groupsTextView.widthAnchor.constraint(equalToConstant: 270).isActive = true
    groupsTextView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
    groupsTextView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
  }
}
