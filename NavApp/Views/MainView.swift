//
//  MainView.swift
//  NavApp
//
//  Created by Olimpia on 2/12/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import UIKit

class MainView: UIView {
  
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
    
    lazy var keywordtextFied: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 0.5
        textField.placeholder = "eg. Coffe, Pizza"
        textField.backgroundColor = #colorLiteral(red: 0.8023978472, green: 0.8596076369, blue: 0.9537505507, alpha: 1)
        return textField
    }()
    
    lazy var secondTextField: UITextField = {
        let secondTextField = UITextField()
        secondTextField.layer.cornerRadius = 5
        secondTextField.layer.borderWidth = 0.5
        secondTextField.placeholder = "Type a place eg. New York"
        secondTextField.backgroundColor = #colorLiteral(red: 0.8023978472, green: 0.8596076369, blue: 0.9537505507, alpha: 1)
        return secondTextField
    }()

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        addSubview(keywordtextFied)
        addSubview(mapButton)
        addSubview(listButton)
        addSubview(titleLablel)
        addSubview(secondTextField)
        setConstrains()
        
    }
    
    func setConstrains() {
        
        listButton.translatesAutoresizingMaskIntoConstraints = false
        [listButton.topAnchor.constraint(equalTo: titleLablel.bottomAnchor, constant: 45), listButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0), listButton.trailingAnchor.constraint(equalTo: keywordtextFied.leadingAnchor, constant: 0)].forEach{ $0.isActive = true }
        
        mapButton.translatesAutoresizingMaskIntoConstraints = false
        [mapButton.topAnchor.constraint(equalTo: titleLablel.bottomAnchor, constant: 45), mapButton.leadingAnchor.constraint(equalTo: keywordtextFied.trailingAnchor, constant: 0), mapButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0)].forEach{ $0.isActive = true }
        
        
        keywordtextFied.translatesAutoresizingMaskIntoConstraints = false
        [keywordtextFied.topAnchor.constraint(equalTo: titleLablel.bottomAnchor, constant: 35), keywordtextFied.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 40), keywordtextFied.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -40), keywordtextFied.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.05)].forEach{ $0.isActive = true }
        
        secondTextField.translatesAutoresizingMaskIntoConstraints = false
        [secondTextField.topAnchor.constraint(equalTo: keywordtextFied.bottomAnchor, constant: 11), secondTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 40), secondTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -40), secondTextField.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.05)].forEach{ $0.isActive = true }

       
        
        titleLablel.translatesAutoresizingMaskIntoConstraints = false
        [titleLablel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0), titleLablel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0), titleLablel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0), titleLablel.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.65)].forEach{ $0.isActive = true }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
