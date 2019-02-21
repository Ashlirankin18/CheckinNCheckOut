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
    textView.font = UIFont.boldSystemFont(ofSize: 16)
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
    backgroundColor = .white
  }
  
}
extension GroupsCell{
  
  func setUpView(){
    setUpTextViewConstraint()
  }
  
  func setUpTextViewConstraint(){
    addSubview(groupsTextView)
    groupsTextView.translatesAutoresizingMaskIntoConstraints = false
    groupsTextView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
    groupsTextView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
    groupsTextView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
    groupsTextView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
  }
}
