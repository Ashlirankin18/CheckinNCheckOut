//
//  CreateVenueViewController.swift
//  NavApp
//
//  Created by Jeffrey Almonte on 2/11/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import UIKit

class CreateTipViewController: UIViewController {

   private var createTipView = CreateTipView()
   // private var tip = [CreateTipModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray
        navigationItem.title = "Create Tip"
view.addSubview(createTipView)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(CancelButtonPressed))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Post", style: .plain, target: self, action: #selector(submitButtonPressed))
       

    }

    @objc func CancelButtonPressed() {
        self.dismiss(animated: true, completion: nil)
    }
   @objc func submitButtonPressed() {
    self.showAlert(title: "Tip Created", message: "Success")
    }
}


