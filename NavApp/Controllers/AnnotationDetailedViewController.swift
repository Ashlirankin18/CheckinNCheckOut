//
//  AnnotationDetailedViewController.swift
//  NavApp
//
//  Created by Olimpia on 2/20/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import UIKit

class AnnotationDetailedViewController: UIViewController {
    
    var annotationView = AnotationDetailedView()
    var venueData = [VenuesInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(annotationView)
        let backButton = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(dismissAction))
        self.navigationItem.leftBarButtonItem  = backButton
            setViewUp()
       
    }
    
    func setViewUp() {
    annotationView.nameLabel.text = venueData.first!.name
        annotationView.addressLable.text = venueData.first?.location.formattedAddress.first
      
        
    }
    
    
    init(vanues: [VenuesInfo]) {
        super.init(nibName: nil, bundle: nil)
        self.venueData = vanues
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    @objc func dismissAction() {
        dismiss(animated: true, completion: nil)
    }


}
