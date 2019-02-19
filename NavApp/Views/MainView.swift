//
//  MainView.swift
//  NavApp
//
//  Created by Olimpia on 2/12/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import UIKit



protocol MainViewDelegate: AnyObject {
    func showObjectFromUser(keyword: String)
}

class MainView: UIView {
    
   weak var delegate: MainViewDelegate?
    
  
    
    lazy var mapButton: UIButton = {
        let cameraButton = UIButton()
        cameraButton.setImage(UIImage(named:"map"), for: .normal)
        return cameraButton
    }()
    
    lazy var listButton: UIButton = {
        let listButton = UIButton()
        listButton.setImage(UIImage(named: "list"), for: .normal)
        return listButton
    }()
    
    
    
    lazy var button1: UIButton = {
        let button1 = UIButton()
        button1.backgroundColor = .white
        button1.layer.cornerRadius = 5
        button1.layer.borderWidth = 1
        button1.layer.borderColor = #colorLiteral(red: 0.3387981057, green: 0.6084808707, blue: 0.9888109565, alpha: 1)
        let myImage = UIImage(named: "coffee")
        button1.setImage(myImage, for: UIControl.State.normal)
        button1.setImage(UIImage(named: "coffee"), for: UIControl.State.highlighted)
        return button1
    }()
    
    lazy var button2: UIButton = {
        let button2 = UIButton()
        button2.layer.cornerRadius = 5
        button2.layer.borderWidth = 1
        button2.layer.borderColor = #colorLiteral(red: 0.3387981057, green: 0.6084808707, blue: 0.9888109565, alpha: 1)
        button2.backgroundColor = .white
        let myImage = UIImage(named: "movies")
        button2.setImage(myImage, for: UIControl.State.normal)
        button2.setImage(UIImage(named: "movies"), for: UIControl.State.highlighted)
        return button2
    }()
    
    lazy var button3: UIButton = {
        let button3 = UIButton()
        button3.layer.cornerRadius = 5
        button3.layer.borderWidth = 1
        button3.layer.borderColor = #colorLiteral(red: 0.3387981057, green: 0.6084808707, blue: 0.9888109565, alpha: 1)
        button3.backgroundColor = .white
        let myImage = UIImage(named: "burger")
        button3.setImage(myImage, for: UIControl.State.normal)
        button3.setImage(UIImage(named: "burger"), for: UIControl.State.highlighted)
        return button3
    }()
    
    lazy var button4: UIButton = {
        let button4 = UIButton()
        button4.layer.cornerRadius = 5
        button4.layer.borderWidth = 1
        button4.layer.borderColor = #colorLiteral(red: 0.3387981057, green: 0.6084808707, blue: 0.9888109565, alpha: 1)
        button4.backgroundColor = .white
        let myImage = UIImage(named: "yoga")
        button4.setImage(myImage, for: UIControl.State.normal)
        button4.setImage(UIImage(named: "yoga"), for: UIControl.State.highlighted)
        return button4
    }()
    
    lazy var button5: UIButton = {
        let button5 = UIButton()
        button5.layer.cornerRadius = 5
        button5.layer.borderWidth = 1
        button5.layer.borderColor = #colorLiteral(red: 0.3387981057, green: 0.6084808707, blue: 0.9888109565, alpha: 1)
        button5.backgroundColor = .white
        let myImage = UIImage(named: "bar")
        button5.setImage(myImage, for: UIControl.State.normal)
        button5.setImage(UIImage(named: "button5"), for: UIControl.State.highlighted)
        return button5
    }()
    
    lazy var seeAllEvents: UIButton = {
        let SeeAllEvents = UIButton()
        SeeAllEvents.backgroundColor = .clear
        SeeAllEvents.layer.cornerRadius = 5
        SeeAllEvents.layer.borderWidth = 1
        SeeAllEvents.layer.borderColor = UIColor.lightGray.cgColor
        SeeAllEvents.setTitle("See all events", for: .normal)
        SeeAllEvents.backgroundColor = #colorLiteral(red: 0.231372549, green: 0.6, blue: 0.9882352941, alpha: 1)
        SeeAllEvents.frame = CGRect(x: 160, y: 100, width: 50, height: 50)
        SeeAllEvents.layer.cornerRadius = 0.5 * SeeAllEvents.bounds.size.width
        SeeAllEvents.clipsToBounds = true
      
        return SeeAllEvents
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
        nameOfapp.font = UIFont(name: "Copperplate", size: 40)!
        //add animation to the label
        return nameOfapp
        
    }()
    
    lazy var textFied: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 0.5
        textField.placeholder = "Enter a zipcode"
        textField.backgroundColor = #colorLiteral(red: 0.8023978472, green: 0.8596076369, blue: 0.9537505507, alpha: 1)
        return textField
    }()

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        addSubview(textFied)
        addSubview(seeAllEvents)
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
        [listButton.topAnchor.constraint(equalTo: titleLablel.bottomAnchor, constant: 45), listButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0), listButton.trailingAnchor.constraint(equalTo: textFied.leadingAnchor, constant: 0)].forEach{ $0.isActive = true }
        
        mapButton.translatesAutoresizingMaskIntoConstraints = false
        [mapButton.topAnchor.constraint(equalTo: titleLablel.bottomAnchor, constant: 45), mapButton.leadingAnchor.constraint(equalTo: textFied.trailingAnchor, constant: 0), mapButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0)].forEach{ $0.isActive = true }
        
        
        textFied.translatesAutoresizingMaskIntoConstraints = false
        [textFied.topAnchor.constraint(equalTo: titleLablel.bottomAnchor, constant: 35), textFied.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 40), textFied.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -40), textFied.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.05)].forEach{ $0.isActive = true }

        seeAllEvents.translatesAutoresizingMaskIntoConstraints = false
        [seeAllEvents.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 40), seeAllEvents.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant:90), seeAllEvents.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -90)].forEach{ $0.isActive = true }
        
        titleLablel.translatesAutoresizingMaskIntoConstraints = false
        [titleLablel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0), titleLablel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0), titleLablel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0), titleLablel.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.50)].forEach{ $0.isActive = true }
        
        button1.translatesAutoresizingMaskIntoConstraints = false
        [button1.topAnchor.constraint(equalTo: textFied.bottomAnchor, constant: 70), button1.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.08), button1.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.15), button1.centerXAnchor.constraint(equalToSystemSpacingAfter: safeAreaLayoutGuide.centerXAnchor, multiplier: 1.0)].forEach{ $0.isActive = true }
        

        button2.translatesAutoresizingMaskIntoConstraints = false
        [button2.topAnchor.constraint(equalTo: textFied.bottomAnchor, constant: 70), button2.heightAnchor.constraint(equalTo: button1.heightAnchor, constant: 0.08), button2.widthAnchor.constraint(equalTo: button1.widthAnchor), button2.leadingAnchor.constraint(equalTo: button1.trailingAnchor, constant: 5)].forEach{ $0.isActive = true }

        button3.translatesAutoresizingMaskIntoConstraints = false
        [button3.topAnchor.constraint(equalTo: textFied.bottomAnchor, constant: 70), button3.heightAnchor.constraint(equalTo: button2.heightAnchor), button3.widthAnchor.constraint(equalTo: button1.widthAnchor), button3.leadingAnchor.constraint(equalTo: button2.trailingAnchor, constant: 5)].forEach{ $0.isActive = true }

        button4.translatesAutoresizingMaskIntoConstraints = false
        [button4.topAnchor.constraint(equalTo: textFied.bottomAnchor, constant: 70), button4.heightAnchor.constraint(equalTo: button2.heightAnchor), button4.widthAnchor.constraint(equalTo: button1.widthAnchor), button4.trailingAnchor.constraint(equalTo: button1.leadingAnchor, constant: -5)].forEach{ $0.isActive = true }
        
        button5.translatesAutoresizingMaskIntoConstraints = false
        [button5.topAnchor.constraint(equalTo: textFied.bottomAnchor, constant: 70), button5.heightAnchor.constraint(equalTo: button4.heightAnchor), button5.widthAnchor.constraint(equalTo: button4.widthAnchor), button5.trailingAnchor.constraint(equalTo: button4.leadingAnchor, constant: -5)].forEach{ $0.isActive = true }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
