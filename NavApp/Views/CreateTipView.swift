//
//  CreateVenueView.swift
//  NavApp
//
//  Created by Jeffrey Almonte on 2/11/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import UIKit

class CreateTipView: UIView {
  
  lazy var createTipTextView: UITextView = {
    let textView = UITextView()
    textView.text = "Enter Tip here."
    textView.font = UIFont(name: "Helvetica", size: 20)
    textView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    textView.layer.cornerRadius = 5
    return textView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: UIScreen.main.bounds)
    commonInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }
  
  private func commonInit() {
    setConstraints()
  }
  
}

extension CreateTipView {
  private func setConstraints() {
    addSubview(createTipTextView)
    
    createTipTextView.translatesAutoresizingMaskIntoConstraints = false
    createTipTextView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
    createTipTextView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 11).isActive = true
    createTipTextView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -11).isActive = true
    createTipTextView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.3).isActive = true
  }
}
