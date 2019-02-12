//
//  ListView.swift
//  NavApp
//
//  Created by Joshua Viera on 2/11/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import UIKit

class ListView: UIView {
    lazy var myTableView: UITableView = {
        let tv = UITableView()
        tv.register(ListTableViewCell.self, forCellReuseIdentifier: "ListTableViewCell")
        return tv
    }()
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit(){
        setConstraints()
    }
    
    private func setConstraints() {
        addSubview(myTableView)
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        myTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        myTableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        myTableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        myTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
}
