//
//  MainView.swift
//  NavApp
//
//  Created by Olimpia on 2/12/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import UIKit

protocol MainViewDelegate: AnyObject {
    func showMapInDetailedView()
}

class MainView: UIView {
    
    var delegate: MainViewDelegate?
    
    lazy var mapButton: UIButton = {
        let cameraButton = UIButton()
        cameraButton.setImage(UIImage(named:"map"), for: .normal)
       // cameraButton.addTarget(self, action: #selector(showMap), for: .touchUpInside)
        return cameraButton
    }()
    
   // @objc func showMap() {
   //     delegate?.showMapInDetailedView()
   // }
    
    lazy var listButton: UIButton = {
        let listButton = UIButton()
        listButton.setImage(UIImage(named: "list"), for: .normal)
        return listButton
    }()
    
    lazy var button1: UIButton = {
        let button1 = UIButton()
        button1.setTitle("red", for: .normal)
        button1.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        button1.layer.cornerRadius = 5
        button1.layer.borderWidth = 1
        button1.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return button1
    }()
    
    lazy var button2: UIButton = {
        let button2 = UIButton()
        button2.setTitle("blue", for: .normal)
        button2.layer.cornerRadius = 5
        button2.layer.borderWidth = 1
        button2.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        button2.backgroundColor = #colorLiteral(red: 0.7041909695, green: 0.7041909695, blue: 0.7041909695, alpha: 1)
        return button2
    }()
    
    lazy var button3: UIButton = {
        let button3 = UIButton()
        button3.setTitle("green", for: .normal)
        button3.layer.cornerRadius = 5
        button3.layer.borderWidth = 1
        button3.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        button3.backgroundColor = #colorLiteral(red: 0.7041909695, green: 0.7041909695, blue: 0.7041909695, alpha: 1)
        return button3
    }()
    
    lazy var button4: UIButton = {
        let button4 = UIButton()
        button4.setTitle("magenta", for: .normal)
        button4.layer.cornerRadius = 5
        button4.layer.borderWidth = 1
        button4.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        button4.backgroundColor = #colorLiteral(red: 0.7041909695, green: 0.7041909695, blue: 0.7041909695, alpha: 1)
        return button4
    }()
    
    lazy var button5: UIButton = {
        let button5 = UIButton()
        button5.setTitle("other", for: .normal)
        button5.layer.cornerRadius = 5
        button5.layer.borderWidth = 1
        button5.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        button5.backgroundColor = #colorLiteral(red: 0.7041909695, green: 0.7041909695, blue: 0.7041909695, alpha: 1)
        return button5
    }()
    
    lazy var buttonToMap: UIButton = {
        let buttonToMap = UIButton()
        buttonToMap.backgroundColor = .clear
        buttonToMap.layer.cornerRadius = 5
        buttonToMap.layer.borderWidth = 1
        buttonToMap.layer.borderColor = UIColor.lightGray.cgColor
        buttonToMap.setTitle("See it in the map", for: .normal)
        buttonToMap.backgroundColor = #colorLiteral(red: 0.6980392157, green: 0.8431372549, blue: 1, alpha: 1)
        return buttonToMap
    }()
    
    lazy var titleLablel: UILabel = {
        let nameOfapp = UILabel()
        nameOfapp.text = "Nav App"
        nameOfapp.backgroundColor = UIColor(patternImage: UIImage(named: "laugh")!).withAlphaComponent(0.8)
        nameOfapp.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        nameOfapp.layer.masksToBounds = true
        nameOfapp.layer.cornerRadius = 5
        nameOfapp.numberOfLines = 0
        nameOfapp.textAlignment = .center
        nameOfapp.font = UIFont(name: "Copperplate", size: 35)!
        //add animation to the label 
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
        addSubview(button3)
        addSubview(button4)
        addSubview(button5)
        addSubview(mapButton)
        addSubview(listButton)
        addSubview(titleLablel)
        setConstrains()
        
    }
    
    func setConstrains() {
        
        listButton.translatesAutoresizingMaskIntoConstraints = false
        [listButton.topAnchor.constraint(equalTo: titleLablel.bottomAnchor, constant: 45), listButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0), listButton.trailingAnchor.constraint(equalTo: searchBar.leadingAnchor, constant: 0)].forEach{ $0.isActive = true }
        
        mapButton.translatesAutoresizingMaskIntoConstraints = false
        [mapButton.topAnchor.constraint(equalTo: titleLablel.bottomAnchor, constant: 45), mapButton.leadingAnchor.constraint(equalTo: searchBar.trailingAnchor, constant: 0), mapButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0)].forEach{ $0.isActive = true }
        
        
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        [searchBar.topAnchor.constraint(equalTo: titleLablel.bottomAnchor, constant: 35), searchBar.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 40), searchBar.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -40)].forEach{ $0.isActive = true }
//
//        buttonToMap.translatesAutoresizingMaskIntoConstraints = false
//        [buttonToMap.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 35), buttonToMap.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 120), buttonToMap.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -120)].forEach{ $0.isActive = true }
        
        titleLablel.translatesAutoresizingMaskIntoConstraints = false
        [titleLablel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0), titleLablel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0), titleLablel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0), titleLablel.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.50)].forEach{ $0.isActive = true }
        
        button1.translatesAutoresizingMaskIntoConstraints = false
        [button1.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 70), button1.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.08), button1.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.15), button1.centerXAnchor.constraint(equalToSystemSpacingAfter: safeAreaLayoutGuide.centerXAnchor, multiplier: 1.0)].forEach{ $0.isActive = true }
        

        button2.translatesAutoresizingMaskIntoConstraints = false
        [button2.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 70), button2.heightAnchor.constraint(equalTo: button1.heightAnchor, constant: 0.08), button2.widthAnchor.constraint(equalTo: button1.widthAnchor), button2.leadingAnchor.constraint(equalTo: button1.trailingAnchor, constant: 5)].forEach{ $0.isActive = true }

        button3.translatesAutoresizingMaskIntoConstraints = false
        [button3.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 70), button3.heightAnchor.constraint(equalTo: button2.heightAnchor), button3.widthAnchor.constraint(equalTo: button1.widthAnchor), button3.leadingAnchor.constraint(equalTo: button2.trailingAnchor, constant: 5)].forEach{ $0.isActive = true }

        button4.translatesAutoresizingMaskIntoConstraints = false
        [button4.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 70), button4.heightAnchor.constraint(equalTo: button2.heightAnchor), button4.widthAnchor.constraint(equalTo: button1.widthAnchor), button4.trailingAnchor.constraint(equalTo: button1.leadingAnchor, constant: -5)].forEach{ $0.isActive = true }
        
        button5.translatesAutoresizingMaskIntoConstraints = false
        [button5.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 70), button5.heightAnchor.constraint(equalTo: button4.heightAnchor), button5.widthAnchor.constraint(equalTo: button4.widthAnchor), button5.trailingAnchor.constraint(equalTo: button4.leadingAnchor, constant: -5)].forEach{ $0.isActive = true }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
