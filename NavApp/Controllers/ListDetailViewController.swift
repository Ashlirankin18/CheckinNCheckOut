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
  
  var venue: VenuesInfo?
 
  
  init (venue:VenuesInfo){
    super.init(nibName: nil, bundle: nil)
    self.venue = venue
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override func viewDidLoad() {
        super.viewDidLoad()
       
      view.addSubview(listDetailView)
      view.backgroundColor = .yellow
      navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addButtonPressed))
      navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backButtonPressed))
    modalTransitionStyle = .coverVertical
    modalPresentationStyle = .currentContext
    setUpUi()
    }
    @objc func addButtonPressed(){
       //segue to the create TabViewController
        
    }
  @objc func backButtonPressed(){
    dismiss(animated: true, completion: nil)
  }
  func setUpUi(){
    listDetailView.venueName.text = venue?.name
    listDetailView.a.text = venue?.location.formattedAddress.first
  }
}
