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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(annotationView)
        view.backgroundColor = #colorLiteral(red: 0.7743045092, green: 0.5028291345, blue: 0.9905084968, alpha: 1)
     
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
