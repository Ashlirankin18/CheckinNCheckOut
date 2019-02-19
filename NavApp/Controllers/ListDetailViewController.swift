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
    
    // take out or change from being hardcoded
   let titleTest = "Coffeed"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.addSubview(listDetailView)
        view.backgroundColor = .yellow
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addButtonPressed))
    }
    @objc func addButtonPressed(){
        //testing the segue
         let creatVC = CreateTipViewController()
        creatVC.venueBeingReviewed = titleTest
        let navController = UINavigationController(rootViewController: creatVC)
        self.present(navController, animated: true, completion: nil)
    }
    //delete beofre committing
}
