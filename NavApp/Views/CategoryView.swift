//
//  CategoryView.swift
//  NavApp
//
//  Created by Olimpia on 2/20/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import UIKit

class CategoryView: UIView {
    
    lazy var categoryTableView: UITableView = {
        let tv = UITableView()
        
        return tv
    }()

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        addSubview(categoryTableView)
        setConstrains()
        categoryTableView.register(UITableViewCell.self, forCellReuseIdentifier: "CategoryView")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstrains() {
        categoryTableView.translatesAutoresizingMaskIntoConstraints = false
        [categoryTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0), categoryTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0), categoryTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0), categoryTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0)].forEach{ $0.isActive = true }
    }
    
}
