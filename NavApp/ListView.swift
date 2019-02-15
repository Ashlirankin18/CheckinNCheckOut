//
//  ListView.swift
//  NavApp
//
//  Created by Olimpia on 2/14/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import UIKit

class ListView: UIView {

   
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        addSubview(tableView)
        tableViewConstrains()
    }
    
    func tableViewConstrains() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        [tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0), tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0), tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0), tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0)]
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
