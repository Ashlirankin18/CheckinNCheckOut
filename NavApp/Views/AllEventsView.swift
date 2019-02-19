//
//  AllEventsView.swift
//  NavApp
//
//  Created by Olimpia on 2/19/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import UIKit

class AllEventsView: UIView {

    lazy var myTableView: UITableView = {
        let myTableView = UITableView()
        return myTableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        addSubview(myTableView)
    }
    
    func setConstains() {
       myTableView.translatesAutoresizingMaskIntoConstraints = false
        [myTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0), myTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0), myTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0), myTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0)].forEach{ $0.isActive = true }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
