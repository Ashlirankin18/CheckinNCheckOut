//
//  MainView.swift
//  NavApp
//
//  Created by Olimpia on 2/12/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import UIKit

class MainView: UIView {
    
    
    
    lazy var button1: UIButton = {
        let button1 = UIButton()
        button1.setTitle("button 1", for: .normal)
        button1.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return button1
    }()
    
    lazy var button2: UIButton = {
        let button2 = UIButton()
        button2.setTitle("button 2", for: .normal)
        button2.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return button2
    }()
    
    lazy var buttonToMap: UIButton = {
        let buttonToMap = UIButton()
        
        buttonToMap.backgroundColor = .clear
        buttonToMap.layer.cornerRadius = 5
        buttonToMap.layer.borderWidth = 1
        buttonToMap.layer.borderColor = UIColor.black.cgColor
        buttonToMap.setTitle("See it in the map", for: .normal)
        buttonToMap.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        return buttonToMap
    }()
    
    lazy var titleLablel: UILabel = {
        let nameOfapp = UILabel()
        nameOfapp.text = "Nav App"
        nameOfapp.backgroundColor = #colorLiteral(red: 0.3772600293, green: 0.4530673623, blue: 0.9117381573, alpha: 1)
        nameOfapp.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        nameOfapp.layer.masksToBounds = true
        nameOfapp.layer.cornerRadius = 5
        nameOfapp.numberOfLines = 0
        nameOfapp.textAlignment = .center
        nameOfapp.font = UIFont(name: "Thonburi", size: 27)!
        return nameOfapp
        
    }()
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        return searchBar
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        addSubview(searchBar)
        addSubview(buttonToMap)
        addSubview(button1)
        addSubview(button2)
        addSubview(titleLablel)
        setConstrains()
    }
    
    func setConstrains() {
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        [searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0), searchBar.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0), searchBar.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0)].forEach{ $0.isActive = true }
        
        buttonToMap.translatesAutoresizingMaskIntoConstraints = false
        [buttonToMap.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 22), buttonToMap.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 50), buttonToMap.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -50)].forEach{ $0.isActive = true }
        
        titleLablel.translatesAutoresizingMaskIntoConstraints = false
        [titleLablel.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 150), titleLablel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 40), titleLablel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -40), titleLablel.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.08)].forEach{ $0.isActive = true }
        
        button1.translatesAutoresizingMaskIntoConstraints = false
        [button1.topAnchor.constraint(equalTo: titleLablel.bottomAnchor, constant: 35), button1.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -50), button1.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 50), button1.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.025)].forEach{ $0.isActive = true }
        
        
        
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
