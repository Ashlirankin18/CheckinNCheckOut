//
//  ListDetailViewController.swift
//  NavApp
//
//  Created by Joshua Viera on 2/11/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import UIKit

class ListDetailViewController: UIViewController {
    
    
    let listDetailView = ListDetailView()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.addSubview(listDetailView)
        view.backgroundColor = .yellow
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addButtonPressed))
    }
    @objc func addButtonPressed(){
       //segue to the create TabViewController
        
    }
}
