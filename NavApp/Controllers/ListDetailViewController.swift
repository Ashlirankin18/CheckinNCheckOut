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
    var isSucessfullyCreated: Bool?
    // take out or change from being hardcoded
    
    let titleTest = "Coffeed"
    private var testVenueName = ListTableViewCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listDetailView.createTipButton.addTarget(self, action: #selector(addTipButtonPressed), for: .touchUpInside)
        view.addSubview(listDetailView)
        view.backgroundColor = .yellow
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add to Collection", style: .plain, target: self, action: #selector(addButtonPressed))
    }
    @objc func addButtonPressed(){
        //testing the segue
                 let creatVC = CreateTipViewController()
                creatVC.venueBeingReviewed = titleTest
                let navController = UINavigationController(rootViewController: creatVC)
                self.present(navController, animated: true, completion: nil)
        let venueToAddToCollection = CollectionPersistanceHelper.getUserInfo()
        
        
        
    }
    
    @objc func addTipButtonPressed(){
        let creatVC = CreateTipViewController()
        creatVC.venueBeingReviewed = titleTest
        let navController = UINavigationController(rootViewController: creatVC)
        self.present(navController, animated: true, completion: nil)
    }
    
    
    
}
