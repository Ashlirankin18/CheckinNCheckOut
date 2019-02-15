//
//  MainViewController.swift
//  NavApp
//
//  Created by Ashli Rankin on 2/8/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//
import UIKit

class MainViewController: UIViewController {
    
    var mainView = MainView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
       view.addSubview(mainView)
        
    }
     
    
    
    
}
